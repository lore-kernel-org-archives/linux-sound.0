From: Simon Kagedal <simon@sdf.se>
Date: Sun, 25 Apr 1999 17:34:36 +0000
Subject: Re: /dev/midi apps
Message-Id: <marc-linux-sound-92506176118717@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92462758903047@msgid-missing>
In-Reply-To: <marc-linux-sound-92462758903047@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Tue, Apr 20, 1999 at 09:45:07AM -0700, Bertrand Lee wrote:
> Are there any apps that use /dev/midi for playback/recording?
>=20
> All the apps that I have come across (rosegarden, playmidi, etc.) seem to
> use /dev/sequencer, which my soundcard (es1370) does not support.
>=20
> Appreciate any pointers!

`midid' can do that, it handles timing of events itself w/o using
/dev/sequencer.  It has a midifile player app but no app for recording,
IIRC. =20

http://www.umr.edu/~johns/projects/midid/

--=20
Simon K=E5gedal <simon@sdf.se> - Homepage: http://www.sdf.se/~simon/
