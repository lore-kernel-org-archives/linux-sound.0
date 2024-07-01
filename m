Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BE37C
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792439; cv=none; b=fIlYBvMiBcEyNMFaEQnfFZC0iWV5VBt4ZCohgas8GMoEvdK8VWz4KAnubVrJEh3OwfXOh0xy+espOV1TH+/imIa58y6lh/+Z13GynI8WGlUTOantCk9v0b9nuAl+pP/TFzWJSyZwUSzU4V+vWJ3AaZBCNDNbVvYXb4vaiorPXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792439; c=relaxed/simple;
	bh=+MxkO4vVdthV7j6mFV/7SPcQj12oitKeXtcQAI267PY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=kNJ1YNCd7QaP6ISsbD4XmUhCncz/Tu+wG9UuXRSrbkp8sgqNvPaSdzSwY09fuw6U5n+keSfcizJLorF0WnWqBv/nYH0dMs/YMREPlEDzIk3Rncako/oIsFW7i4yzOd+Vv3Wml+6tLlGmKvuXfV0HNM5woelHKIN+kHi3f6Lv4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=grVIlFxS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pn6icnKi; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="grVIlFxS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pn6icnKi"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 052AF1380256;
	Sun, 30 Jun 2024 20:07:16 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sun, 30 Jun 2024 20:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1719792436; x=
	1719878836; bh=+MxkO4vVdthV7j6mFV/7SPcQj12oitKeXtcQAI267PY=; b=g
	rVIlFxS4PQCQ4iOMByp7mvKQIK6SvLZr8FbJ5WtIRdcI89pnLbBgpkedStEkcXNs
	2+v08hMklAt1PfQMBuwiY5dhFdNA3eXOcixSXM/2OjdceMT5b3Eqy8Efsju+hMb3
	VnJFY5SaGONlORw5xUgFoCOHYeSbLCLUi/PG55B9f5ErF0O2qc7dREkUrowgtWEN
	Oe2OsgzmsQDHjkAPh1CY6r1FmDIOxFsnePftaiRctrZbWCpnU4wVPSJ6FyDzE+qL
	nb3D7BQkY9oZXQ7E8+vvADAIZJykpn+hg2GPksO5XcQdrwQY61iBFekQlndRZiOr
	gXjjJYkyoAjlxcx1BzrBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719792436; x=1719878836; bh=+MxkO4vVdthV7j6mFV/7SPcQj12o
	itKeXtcQAI267PY=; b=Pn6icnKiVdJp+jnc+p1CA6TQ9yGKYIL/vrzCiHevEk2I
	7NxQk2GW9LDfZLAEHCZHeciWNUdJJ28Tfvp4meIAv1td2mZc9wL7j0ii9jEp7a3S
	LSCNTZy/Fxm31+FPOH6FTYHFDSw6OaCsncaPeyFYyfagqAg5somO8NZtRfhkRxib
	BRrr3Jkl5sq1T6lkljMGaoHlR+mgXfFoUGFF7mbOIzpHeioy9RU6xiJe7MnIozt7
	TiB88F71FSxsx4hn8Tad8VJTp+bi9076FHhzoXBDT86YixvzCQI2qIKKrCstr+w5
	PB8CREZQTAoK79kOv2kcg8oEB8njtWbn6/giaAW/Vg==
X-ME-Sender: <xms:MvOBZl9TA9fomzzsplZyl57RB8u_dcle9C0PGYAjauLXWJYakFiLGA>
    <xme:MvOBZpv12w6TM1VB3y_McIA5x2SuEg-Vs7Gka8eKlZFURWUvpd1beuFu5wZsJ6_IG
    Djo7s3AidrQEgd05rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfvrghk
    rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
    hirdhjpheqnecuggftrfgrthhtvghrnheptdfhvefhtdehleffvdetteffieelfedttefg
    keeuleetfeevjefhgeevffffudfhnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:MvOBZjAtlb7vd5sKnTrde27poRqOQf9q-8wAFsp1Y92uujOaiL1hgA>
    <xmx:MvOBZpfJQLmgk-mfcB4X1ebx0gfa0tPuM52jkt_PUk9XzyimqBDKZw>
    <xmx:MvOBZqNDKxsUXXlC7_0WpyptxTocfsRnh-nA6J0GwUrOs3Bzve53OQ>
    <xmx:MvOBZrnaWqUtMbKF-7858Hi3w9HtsKsWL9SYyzaQExue18mnLGPoQQ>
    <xmx:M_OBZnoVx-ndTbERbN-xEh3UdR7xwxZjsiNkGlY6sdb52m0r_R25l_db>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 99CAA36A0074; Sun, 30 Jun 2024 20:07:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e0ed11c2-a4bf-40ec-95ad-fa61d95987c7@app.fastmail.com>
In-Reply-To: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Date: Mon, 01 Jul 2024 09:06:43 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Asahi Lina" <lina@asahilina.net>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Cc: "Takashi Iwai" <tiwai@suse.com>, "Jaroslav Kysela" <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
Content-Type: text/plain

Hi,

I'm a maintainer of both ALSA firewire stack and Linux firewire subsystem. As
long as I know, there is neither consensus nor specific userspace API/structure
to the issue , therefore each developer selects each way within current
implementation of ALSA control core and userspace interface.

On Mon, Jul 1, 2024, at 01:04, Asahi Lina wrote:
> The problem is that the device has a 66x34 matrix mixer, with up to 2048
> cross points enabled at once. Exposing each cross point as an ALSA mixer
> control (similar to how mixer_scarlett2.c does it) would mean 2244
> controls just for the mixer... which seems like a bit too much.
>
> On top of that there is also VU meter feedback for all the
> inputs/outputs, as well as general fader controls for each output and
> global output configs and status. I'm not sure about the VU meters, but
> everything else sounds like it would map fine to normal mixer controls.
>
> Is there some recommended way to expose this kind of matrix mixer
> interface to userspace? I think for something like this you pretty much
> have to rely on device-specific tools to make the UX manageable, so
> maybe hwdep... but at least exposing everything as an ALSA control would
> have the advantage of supporting save/restore with something like
> alsactl. So I don't really know what's the way to go here.

In my opinion, expose of such many control elements would not be necessarily
convenient to users, especially to who eager to use GUI for such matrix mixer.
Additionally, initialization for all of configurable elements in device would sometimes
require conditional operation somehow (e.g. dependency on sampling rate or
any mode of digital interfaces).

If you have no need to share one of the USB endpoints for any configurable
elemenets between kernel/userspace, it is a simple way to implement such
confuguration application as userspace application, as you did with Python 3 and
libusb.

Anyway, if you eager to change ALSA control core and its interface to userspace
for the purpose, we go for more discussion about it. We share the same interest.


P.S. for devices supported by drivers in ALSA firewire stack, I write some service
programs in userspace to utilize ALSA control "user-defined control element set".
You can find the implementation of protocol to configure RME Fireface
400/800/UCX/808 in it, as well as any DICE-based models:

* https://github.com/alsa-project/snd-firewire-ctl-services/


Regards

Takashi Sakamoto
