From: "James H. Cloos Jr." <cloos@jhcloos.com>
Date: Thu, 08 Jul 1999 15:17:55 +0000
Subject: Re: Microsoft RIFF, WAVE audio data, 1 bit, mono 8000 Hz
Message-Id: <marc-linux-sound-93144986212152@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93141454613681@msgid-missing>
In-Reply-To: <marc-linux-sound-93141454613681@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

>>>>> "Eric" = Eric Mitchell <emitchell@altaira.com> replied:

Eric> There's a field in the wav header for any applied compression
Eric> algorithm.  (www.wotsit.com has decent file format docs).
Eric> What's that set to?  I don't know offhand of any linux .wav
Eric> players that deal correctly with compressed data.

Ah.  That helped.  From that file, the 0x0022 wFormatTag is
WAVE_FORMAT_DSPGROUP_TRUESPEECH.  Also, the 0x20,0x00 is the
size of the remaining raw header data I listed -- data that
is specific to the TRUESPEECH format.  The 0x01,0x00 is the
revision and the 0xf0,0x00 is the number of samples per block.

The rest of the info, esp including the format of the data and all
details of the compression are, according to that document, not
available.

Bummer.

Thanks for the pointer.  I'd managed to forget about wotsit.  *How* I
don't know.  But I had. :(

- -JimC
- -- 
James H. Cloos, Jr.  <http://www.jhcloos.com/cloos/public_key> 1024D/ED7DAEA6 
<cloos@jhcloos.com>     E9E9 F828 61A4 6EA9 0F2B  63E7 997A 9F17 ED7D AEA6

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v0.9.7 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE3hMEhmXqfF+19rqYRArOrAJ9/pstOEPVLKPO1dE9t97jvY8aUuACfZtV6
EPoOAw6cgePRU4wzOLXAyuI=bxZ6
-----END PGP SIGNATURE-----
