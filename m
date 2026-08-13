Received: from a3-25.smtp-out.eu-west-1.amazonses.com (a3-25.smtp-out.eu-west-1.amazonses.com [54.240.3.25])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2A03314AC;
	Thu, 13 Aug 2026 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.3.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786653687; cv=none; b=C8hANf2t18IsjSNWcXacNc8siOUmnDNiH2f4uV6BMrtl4C185PkkQRcGMefHsRUms5PYXuBZLj3t35oJiKV2R4ODTsGqW3TGnsPFmraqdBgTjYSfV6mEAMcJe19L1qWSzcOkyUyNA35PP1cCoayIFyz8nscx/LI6XKg4/bRx9HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786653687; c=relaxed/simple;
	bh=D0psiYScVcCUGPsazJjSp5yNnOmj67E5TdRLkjZcqCc=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=DE9LKPzJAuHA1dqcEnCPRj0zJCcwNHSLR5RZyUHBcUoCKOwqXQq7CuFAkxIupBAnOMaxVPj4vWEP4GKbN5tW4UBlVt3TQQNilC7x9HjiLxQ40mbOJWlcz6JhTZeQWQnL9z8G6dI6w8Bf9K2nS7wMogG85Ta3V/t2jNwT2IxVTCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=androos.io; spf=pass smtp.mailfrom=send.androos.io; dkim=pass (1024-bit key) header.d=androos.io header.i=@androos.io header.b=HX4sIjjx; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=RslVB+q/; arc=none smtp.client-ip=54.240.3.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=androos.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.androos.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=androos.io header.i=@androos.io header.b="HX4sIjjx";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="RslVB+q/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=androos.io; t=1786653684;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=D0psiYScVcCUGPsazJjSp5yNnOmj67E5TdRLkjZcqCc=;
	b=HX4sIjjxhBIFGHxYyfuQqLkPuCv7IegyAsB0cHBsSFzKE+gAsOs/GklNMHPjAbZ/
	6eUpgxVIsJ1rU6802f7HhAIjYqXvm7Ns3r5eRBZ3Fc/KpjTcZsFj2wU/Ds8gPgmX3De
	o3LkWkB3ez+sfq6enhmhPMoBa6eo5LYe9fSTxwDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1786653684;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=D0psiYScVcCUGPsazJjSp5yNnOmj67E5TdRLkjZcqCc=;
	b=RslVB+q/M5kRQ9TdmbZuydUwtsxf+ollnAkoRkIybYVI9dFd8J9KULJ+ZvzkvKva
	IJTWgHqx6J8vSik8JEytWjXwHirJ4EXzUD2Ez39xyEPhZahT49UeC37P8vYzzyU2uH9
	hd6iMWkPSArx7IwUrQ6mK3CdusZg6jxDn6c/P10w=
X-Mailer: git-send-email 2.55.0
From: Neil Andrews <neil@androos.io>
To: tiwai@suse.com, perex@perex.cz
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	neil@androos.io
Subject: [PATCH] ALSA: usb-audio: Rename the Audient iD14 monitor mix
 volume control
Message-ID: <0102019ffcdbb1e6-9b59d3cc-ef05-4df1-8f9f-fb2f425bcda2-000000@eu-west-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 20:41:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.eu-west-1.3mRTAxKqFuDMEE9BXCYRrSI9F/ZrE+OZZeY7XuVrscQZYVwMgTK2N8YsUG39Y6T8JbXGI6yd9YKkugDdKBPWmdzepROBy0b67ml7dTIfUOsjr0TXUDI53RxcdxxVrIw25aOcYei8jbkRArpDbKOfZ3iU5uSK+z8A8A2AHps5yx4=:1.eu-west-1.KEYBhYy5skZtLAf2ooWkoQwfhj0g1VAvm2T4fzvEpSk=:AmazonSES
X-SES-Outgoing: 2026.08.13-54.240.3.25

On the Audient iD14 (2708:0008), feature unit 12 is traced through to
the Speaker output terminal and is therefore exported as "Speaker
Playback Volume".  The name fits it badly.  It advertises Volume on
only four of its six logical channels, which the driver records as
cmask=3D0xf, channels=3D4 on a 6-channel playback stream, and it sits on
the monitor mixer branch rather than in the direct playback path:

  INPUT_TERMINAL 2 (USB streaming, 6ch) -> EXTENSION_UNIT 51 ->
    FEATURE_UNIT 10 (no controls) -> OUTPUT_TERMINAL 20 (Speaker)

while FU 12 hangs off MIXER_UNIT 60 and feeds back into
EXTENSION_UNIT 51.

Userspace adopts the control as the stream's hardware playback volume,
so any setting below 0 dB attenuates part of the stream and not the
rest.  Measured over the device's own digital loopback, with one
-12 dBFS tone per channel played straight to hw:, PCM channel 0 is
unaffected while channel 1 tracks the control: at 107/127 (-20 dB) the
two read -15.89 and -35.89 dBFS, a 20.00 dB imbalance, and at 127/127
both read -15.89 dBFS.

Give the unit a non-standard name so that it is no =
longer taken for
the stream's master volume.  Dropping the control instead =
also fixes
the imbalance, but FU 12 keeps its value across a module reload,=
 so
dropping it strands a device that is already attenuated with nothing
able to reset it.  Renaming leaves the monitor gain reachable and that
recovery path intact.

The mapped name ends in "Playback" because a name =
from the map
suppresses the automatic " Playback" but still gets " Volume"
appended; the control comes out as "Monitor Mix Playback Volume".

Tested on the ACP path with PipeWire, which is where the problem
reproduces: the control now stays at 127 at every volume setting and
the imbalance is 0.00 dB, and setting it by hand to 107 and back to
127 gives 20.00 dB and 0.00 dB as before.

Link: https://lore.kernel.=
org/linux-sound/0102019fed22f9d3-fa294ec5-02f1-4fd3-b3fa-76efc14331cc-00000=
0@eu-west-1.amazonses.com/T/#u
Signed-off-by: Neil Andrews <neil@androos.=
io>
---
 sound/usb/mixer_maps.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/usb/mixer_maps.c =
b/sound/usb/mixer_maps.c
index ce27fc871..8046d5987 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -505,6 +505,19 @@ static const struct usbmix_connector_map =
gigabyte_b450_connector_map[] =3D {
 	{}
 };
=20
+/* Audient iD14: FU 12 =
advertises Volume on only 4 of its 6 logical channels
+ * and sits on the monitor mixer branch, but it is traced through to the
+ * Speaker output terminal and gets named "Speaker Playback Volume".  =
Userspace
+ * then adopts it as the stream's hardware volume, and any =
setting below 0 dB
+ * attenuates some channels but not others (20 dB =
imbalance at 80%).  Give it a
+ * non-standard name so that it is no longer=
 taken for the stream's master
+ * volume, while remaining reachable for =
anyone who wants the monitor gain.
+ */
+static const struct =
usbmix_name_map audient_id14_map[] =3D {
+	{ 12, "Monitor Mix Playback" },	=
/* FU, partial coverage */
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -588,6 +601,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] =
=3D {
 		.id =3D USB_ID(0x2573, 0x0008),
 		.map =3D maya44_map,
 	},
+	{
+		/* Audient iD14 */
+		.id =3D USB_ID(0x2708, 0x0008),
+		.map =3D audient_id14_map,
+	},
 	{
 		/* KEF X300A */
 		.id =3D USB_ID(0x27ac, 0x1000),
