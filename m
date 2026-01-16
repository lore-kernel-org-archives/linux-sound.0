Received: from us-smtp-delivery-172.mimecast.com (us-smtp-delivery-172.mimecast.com [170.10.133.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ECB283FEA
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 22:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768604357; cv=none; b=K/Z40ELaHRosgE//03l0BjicP584w8TDQYtkZ231mf8bEtpUUodk/cZWa6QzPjItASEYcyP/Q/lJXo5P6OmKDk5hCrpwtylFl7+rGy/icoGjU7LYKcvR/pV9W8QUMRNM+QFXKpqlN1lPSp0xtL+KahRYoTgiqiIS0AXY7CEIgP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768604357; c=relaxed/simple;
	bh=mbjB33ZjG4vH0kllRqmfEZlKkchn0jBdNBGICqbFARs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fKnW3uvdIYQr1GBbvDaRt4KQEUiHjBpIVQ+P4x6e8oFmSUvusPaDzG4D1LgzoFuxhpR3geavLzVktaA6VYhIgw1aNuAv9XWTejFFO3xNJ7pJ/6NBdTe9qxGNjmnfQB2vxJ4UjeZMQ0haDtnULUUNKbVfG7Fa1EUEG77nKWBcloI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com; spf=pass smtp.mailfrom=valvesoftware.com; dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b=MktWaRJu; arc=none smtp.client-ip=170.10.133.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b="MktWaRJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
	s=mc20150811; t=1768604353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DLWQflPWQEF+ZPjUeS1HW5xexKBokrhMIwfMbICq3c0=;
	b=MktWaRJuWGZRfXTD0o5lWfMGTol03Ou+qLJR2xRF/MbetzFrwwG95K/RfKrtHqaFzckv1c
	AlhrELIVN/h2l4kBHPFkzDLPvk+uLO4t2IUrSzPAIja99gs9sOmqiVFX5LoXWyQBXLNhA2
	+yfWYJj8gzVqQd+Mq+9ygRdJlijC5RM=
Received: from smtp-01-tuk3.valvesoftware.com
 (smtp-01-tuk3.valvesoftware.com [208.64.203.181]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-542-I8lXkJhmPkul1_7XiLeS4A-1; Fri, 16 Jan 2026 17:59:11 -0500
X-MC-Unique: I8lXkJhmPkul1_7XiLeS4A-1
X-Mimecast-MFC-AGG-ID: I8lXkJhmPkul1_7XiLeS4A_1768604350
Received: from antispam.valve.org ([172.16.1.107])
	by smtp-01-tuk3.valvesoftware.com with esmtp (Exim 4.97)
	(envelope-from <arunr@valvesoftware.com>)
	id 1vgsmc-00000005Ozo-0eUp;
	Fri, 16 Jan 2026 14:59:10 -0800
Received: from antispam.valve.org (127.0.0.1) id hdb1bs0171sq; Fri, 16 Jan 2026 14:59:10 -0800 (envelope-from <arunr@valvesoftware.com>)
Received: from mail2.valvemail.org ([172.16.144.23])
	by antispam.valve.org ([172.16.1.107]) (SonicWall 10.0.15.7233)
	with ESMTP id o202601162259100017826-5; Fri, 16 Jan 2026 14:59:10 -0800
Received: from fedora.valve.org (172.18.17.18) by mail2.valvemail.org
 (172.16.144.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 14:59:09 -0800
From: Arun Raghavan <arunr@valvesoftware.com>
To: <linux-kernel@vger.kernel.org>
CC: Arun Raghavan <arun@arunraghavan.net>, Arun Raghavan
	<arunr@valvesoftware.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH] alsa: usb: Increase volume range that triggers a warning
Date: Fri, 16 Jan 2026 14:58:04 -0800
Message-ID: <20260116225804.3845935-1-arunr@valvesoftware.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: mail2.valvemail.org (172.16.144.23) To mail2.valvemail.org
 (172.16.144.23)
X-Mlf-DSE-Version: 6871
X-Mlf-Rules-Version: s20260114215137; ds20230628172248;
	di20260109183045; ri20160318003319; fs20260116204909
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: arunr@valvesoftware.com
X-Mlf-Version: 10.0.15.7233
X-Mlf-License: BSV_C_AP_T_R
X-Mlf-UniqueId: o202601162259100017826
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L5_52vOaaf1suYQ1tMH_pOwE3dFCrPhdjGzKOywYX7U_1768604350
X-Mimecast-Originator: valvesoftware.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

On at least the HyperX Cloud III, the range is 18944 (-18944 -> 0 in
steps of 1), so the original check for 255 steps is definitely obsolete.
Let's give ourselves a little more headroom before we emit a warning.

Fixes: 80acefff3bc7 ("ALSA: usb-audio - Add volume range check and warn if =
it too big")
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>
---
 sound/usb/mixer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 3af71d42b9b9..90917c6ea871 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1813,11 +1813,10 @@ static void __build_feature_ctl(struct usb_mixer_in=
terface *mixer,
=20
 =09range =3D (cval->max - cval->min) / cval->res;
 =09/*
-=09 * Are there devices with volume range more than 255? I use a bit more
-=09 * to be sure. 384 is a resolution magic number found on Logitech
-=09 * devices. It will definitively catch all buggy Logitech devices.
+=09 * There are definitely devices with a range of ~20,000, so let's be
+=09 * conservative and allow for a bit more.
 =09 */
-=09if (range > 384) {
+=09if (range > 65535) {
 =09=09usb_audio_warn(mixer->chip,
 =09=09=09       "Warning! Unlikely big volume range (=3D%u), cval->res is =
probably wrong.",
 =09=09=09       range);
--=20
2.52.0

