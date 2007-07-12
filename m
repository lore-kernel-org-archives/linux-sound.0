From: Baeckham <baeckham@gmx.net>
Date: Thu, 12 Jul 2007 14:51:46 +0000
Subject: microphone is recording but very quit
Message-Id: <200707121651.46382.baeckham@gmx.net>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I problem using a microphone with my laptop.

I have an Intel ICH7 HDA audio controller
# lspci
...
00:1b.0 Audio device: Intel Corporation 82801G (ICH7 Family) High Definition 
Audio Controller (rev 02)

and use this alsa modules:

# lsmod
Module                  Size  Used by
snd_pcm_oss            39808  0
snd_mixer_oss          14912  1 snd_pcm_oss
snd_seq_oss            29440  0
snd_seq_midi_event      6976  1 snd_seq_oss
snd_seq                48928  4 snd_seq_oss,snd_seq_midi_event
snd_seq_device          7060  2 snd_seq_oss,snd_seq
snd_hda_intel         302688  1
snd_pcm                73864  2 snd_pcm_oss,snd_hda_intel
snd_timer              19912  2 snd_seq,snd_pcm
snd                    52136  10 
snd_pcm_oss,snd_mixer_oss,snd_seq_oss,snd_seq,snd_seq_device,snd_hda_intel,snd_pcm,snd_timer
snd_page_alloc          8080  2 snd_hda_intel,snd_pcm

First I thought the microphone wouldn't work at all, but then I recognized it 
is just very very quiet. I have to set the volume to the max to able to 
record a play back my voice again ...

What might be the reason???

Thanx for any ints.

Steffen
