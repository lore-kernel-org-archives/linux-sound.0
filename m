From: Jeff Garzik <jgarzik@mandrakesoft.com>
Date: Wed, 21 Mar 2001 01:14:03 +0000
Subject: Re: 2.4.x kernel: es1371 driver
Message-Id: <marc-linux-sound-98513737203593@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-98511855415300@msgid-missing>
In-Reply-To: <marc-linux-sound-98511855415300@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Jens G=FCnther wrote:
> In the 2.4.3-pre4 and 2.4.2-ac20 config there is no way to specify the
> I/O-port for the joystick when you build the driver into the kernel, alth=
ough
> the module seems to accept the "joystick=3D" option. Is this intentional?=
 The
> module parameter is mentioned in drivers/sound/es1371.c . There is no hint
> concerning the I/O-port when building the driver into the kernel. Does it
> have to be done by a kernel option?

Yes.  should be "es1371=3D[joystick port]"

--=20
Jeff Garzik       | May you have warm words on a cold evening,
Building 1024     | a full mooon on a dark night,
MandrakeSoft      | and a smooth road all the way to your door.
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
