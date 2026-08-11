Received: from a3-11.smtp-out.eu-west-1.amazonses.com (a3-11.smtp-out.eu-west-1.amazonses.com [54.240.3.11])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9401367B84
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 18:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472030; cv=none; b=PvTWc3Yn6ziJ3rALvByrJn1Ciqf8Q3JMstRLDSRig1n/u3/wRuiH00qP3h+OhUuK3j+1qldv493rhH+gd7xi0mTHJ4DuPJRiOaDo+wYNkn1GKvZ01koHNmcPbs+OuoAuxL/EhaZOhHRfsyjipkByL/di+zhyaqpaild1beTaoak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472030; c=relaxed/simple;
	bh=Ma11O4/yFAaRckRnWqKsL5xjpMfwjgkjWIwAzrYTY1g=;
	h=In-Reply-To:From:To:Cc:Subject:Message-ID:Date:MIME-Version:
	 Content-Type; b=aSpZaT+I/qnMt0YzjAkewlu7VPoxmds3CwgpDZpWJqZhVBFoCdXbylk6kBWhvqhLtq33BCbOojCFugp/jN20hj2Dn4lIQDdDqoT9A26VxmcyGey38a0AHmgLZt8OqOFpB5Uu3ntOeFjyeXLI4PpChp0B0EOAMKvL/BeTgBx2aJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=androos.io; spf=pass smtp.mailfrom=send.androos.io; dkim=pass (1024-bit key) header.d=androos.io header.i=@androos.io header.b=bF+A9LuJ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=FmK9nS3V; arc=none smtp.client-ip=54.240.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=androos.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.androos.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=androos.io header.i=@androos.io header.b="bF+A9LuJ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="FmK9nS3V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=androos.io; t=1786472025;
	h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=Ma11O4/yFAaRckRnWqKsL5xjpMfwjgkjWIwAzrYTY1g=;
	b=bF+A9LuJVpsOIpivjbvaFgRh1WnP343n+aLRx6BuFwXLankTu1QNjPbe2jdZW4Am
	eh4bpxci/UC7TwUsdaXrfkktBqrqsD6FxTKe0WpIif47RhhyjxA6lgvNWDPTPa21txN
	IcfgJZwaScm50HruhNNNH10ECgE+G7e4ZkteMhmU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1786472025;
	h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=Ma11O4/yFAaRckRnWqKsL5xjpMfwjgkjWIwAzrYTY1g=;
	b=FmK9nS3V9K2LRzHZ4+d32k4V8bRyxjhidm0q51v81IT0c8UNF64EB58UKl3DkpkQ
	KtC9UzHdSg1sJaWXi8uq3+QyujD4fTujACPc6sWWD81zByz/IPpfembhqtS9iqTmTDC
	YXVm5Ig+djAS1xI+G9ArVV7+gIRXLD/rBWKgpWtg=
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <87h5l1b33j.wl-tiwai@suse.de>
From: Neil Andrews <neil@androos.io>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz
Subject: Re: [BUG] snd-usb-audio: Audient iD14 (2708:0008) 20 dB channel
 imbalance
Message-ID: <0102019ff207ccda-7b65c5af-5c39-4218-ae8e-5ef8d55701e0-000000@eu-west-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 18:13:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.eu-west-1.3mRTAxKqFuDMEE9BXCYRrSI9F/ZrE+OZZeY7XuVrscQZYVwMgTK2N8YsUG39Y6T8JbXGI6yd9YKkugDdKBPWmdzepROBy0b67ml7dTIfUOsjr0TXUDI53RxcdxxVrIw25aOcYei8jbkRArpDbKOfZ3iU5uSK+z8A8A2AHps5yx4=:1.eu-west-1.KEYBhYy5skZtLAf2ooWkoQwfhj0g1VAvm2T4fzvEpSk=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.3.11

On Tue, 11 Aug 2026, Takashi Iwai wrote:
> It's fine to skip the volume if =
it actually improves -- so please test
> it ;)
>
> Judging from your =
description, an alternative with keeping the volume
> control would be to just rename it; the problem is that it's tied with
> "Speaker".  You can name it a different, some non-standard one,
> instead, too.

Hi Takashi,

I tested both on 7.1.6 with sound/usb rebuilt=
 out of tree, measured with
the loopback rig from the original report. Both=
 fix it. I would suggest
the rename.

Baseline, unpatched, PipeWire at 50% =
(control driven to 109/127):
18.00 dB imbalance.

1. { 12, NULL }

Control gone, userspace falls back to software volume, 0.00 dB. So it
does improve.

One wrinkle: FU 12 keeps its value across a module reload, =
so if the
quirk arrives while the hardware is already attenuated, the =
imbalance
stays and there is no longer a control with which to undo it =
(measured:
18.00 dB, control absent). Only a power cycle clears it, which =
matters
for anyone whose saved ALSA state holds a value below 0 dB.

2. { 12, "Monitor Mix Playback" }

--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -495,6 +495,19 @@
 	{}
 };

+/* Audient iD14: FU 12 advertises Volume on only 4 of its 6 logical =
channels
+ * and sits on the monitor-mixer branch, but it is traced through=
 to the
+ * Speaker output terminal and gets named "Speaker Playback =
Volume". Userspace
+ * then adopts it as the stream's hardware volume, and =
any setting below 0 dB
+ * attenuates some channels but not others (20 dB =
imbalance at 80%). Give it a
+ * non-standard name so that it is no longer =
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
@@ -579,6 +592,11 @@
 		.map =3D maya44_map,
 	},
 	{
+		/* Audient iD14 */
+		.id =3D USB_ID(0x2708, 0x0008),
+		.map =3D audient_id14_map,
+	},
+	{
 		/* KEF X300A */
 		.id =3D USB_ID(0x27ac, 0x1000),
 		.map =3D scms_usb3318_map,

Gives numid=3D11,name=3D'Monitor Mix =
Playback Volume'. PipeWire no longer
picks it up (control stays at 127, 0.=
00 dB), and it still works when set
deliberately, so an attenuated device =
can be recovered: 107 by hand
gives 20.00 dB, back to 127 gives 0.00 dB. =
The name ends in "Playback"
because a mapped name suppresses the automatic =
" Playback" but still
gets " Volume" appended.

3. A qualification to my =
report

I said userspace adopts the control as the card's hardware playback
volume, without qualifying it. That is too broad.

alsa-ucm-conf 1.2.16.1 =
ships
USB-Audio/Audient/Audient-iD14-HiFi-0008.conf, which splits the =
device
into 2-channel sinks and declares no playback mixer element. With it=
 in
use PipeWire never touches FU 12: the control stays at 127 at every
volume setting, on both split sinks and on the underlying node.
Reproducing needs the ACP path instead, which I got by setting
api.alsa.use-ucm =3D false for the device in WirePlumber (then 100% ->
127, 80% -> 122, 50% -> 109). All measurements above were taken that
way.

So the affected set is narrower than I implied: the ACP path rather than
that UCM profile, plus anyone whose saved ALSA state carries a value
below 0 dB, since that is restored at boot either way. The descriptor
problem itself is unchanged.

Happy to send either version as a proper =
patch with a Signed-off-by, and
to test anything else on the hardware.

thanks,
Neil
