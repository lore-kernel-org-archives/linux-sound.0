From: Guenther Sohler <guenther.sohler@newlogic.com>
Date: Tue, 16 May 2000 14:49:52 +0000
Subject: Pattern Discovering
Message-Id: <marc-linux-sound-95848990301278@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello List,

In the last time, I spend much time writing GMC.
GMC ist a text to midi translator.
I have had enough success with it and I've got much feedback.

Now I am trying to write the opposite.
I want to translate existing midi files to gmc format.
Getting this flat midi file into flat gmc is quite simple and I achievied this
result already much time before.

Unconfortunately flat notes do not look very nice(ie somehow ugly)

I want to gain back hierarchy.
For example the drums(the rhythm of a song) repeats very often. I want to build
hierarchy in such a way, that this rhythm is just defined once and placed many
times.
The Major problem I have is finding these groups of tunes and finding out, how
they look like.
I have stored all these tunes in a flat list. Each tune has got a
time,length,pich,voice,volume,reverb,....
The order of the entries in this list does not matter, but its actually sorted
by time.
A very good approach, I've found on the internet is the wheeler algorithm,
which seems doing quite well when finding equal patterns.
Unconfortunately I cannot use the wheeler algorithm because In my tunelist the
tunes in such a found pattern need not be subsequent tunes. There can be a
bigger distance - there can be tunes in between, which are not taken up THIS
hierarchy level, but may be another one.

I would appreciate very much that  someone out there has a clue and can help me
this way.

Guenther Sohler
