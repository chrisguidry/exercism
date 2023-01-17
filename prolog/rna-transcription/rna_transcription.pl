rna_complement('G', 'C').
rna_complement('C', 'G').
rna_complement('T', 'A').
rna_complement('A', 'U').

rna_transcription(Dna, Rna) :-
    string_chars(Dna, DnaSequence),
    maplist(rna_complement, DnaSequence, RnaSequence),
    string_chars(Rna, RnaSequence).
