Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16330676E;
	Sat, 30 May 2026 20:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174634; cv=pass; b=pJLdpz1cGw28MvNMumbVYTQbFXGoG2Z4g88+2GVlJ95NdXYYXk317g9fOduvEjiHOnPqyWLPIfFCqe6Yf8Yc4F4Df+nxj31wnXyAdEOmLrBO+3AB45jDVl/19ryOdpxlPgLHKhX+kSw44X7LO7gPR5CINhU76UP8bHaYrA+Mprw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174634; c=relaxed/simple;
	bh=51cms1ifW1H9SfocBkphuM+I2vm8PbuTNsZtmqBdX5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ro9j5Kq2XZ0HheTEhsC1SwmNxfJVZivjBl4J1Fs/tiCLdPzMXas3txog5C22D9s0sInu1FQiJo6du4kepFebdmWFOqLSQVsNbg8mM8mtCe0JDGtniR3JG9Mqlge09axot2dESnjYrEhQ9I2bO4Vox/701bx7qdR0C6xgZ4ao7ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=F11aTkiZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="F11aTkiZ"
ARC-Seal: i=1; a=rsa-sha256; t=1780174626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MvHKRrBWcW+35D4x/NyK6lNfJhqPd4EvJZklrKmuLX7RqFjQyicd0nJuTuWGTvlhedhW4/2nNyqis+uDQ/AktN1H9oQw9bTKMJtdFH2dR/lnfR8a6c/J+QKX1C07b0X1yoOv9RqDb1EQlTzF8dVdJCXo511vGS1Qp77MG7TrQS0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780174626; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R6ifB6WhpsSQciqK7jC3I3x4lKJ+4KprPlIHDhtVO3A=; 
	b=QmZoAXZT3HL0AKd/5HIaolLGQz9MiIv84lK4jyWKR6EBQO6YmLd/hQ+G7fquXfPzTDj2TsjuXY9dI/5GtELcUjpU0AY2A+vSsv3nmFB8O1t/fMJFyz6dz/l1kdqXU8TSsm+z6Fdahj9Tg3AYYCbzT1dBK35LXYFy3E8I4qJuRDM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780174626;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=R6ifB6WhpsSQciqK7jC3I3x4lKJ+4KprPlIHDhtVO3A=;
	b=F11aTkiZ6m0H1HJzdiYLA/RQXLeGfqwDUWoECnD9AYEWRl9lQHX45PumrsQL7Ici
	Q/24wpyPxjjBJa76IFunYn6ig3oTUqHO6jGnXASsvd7TGauap8ZfWSZjVzMh2O17xBo
	7cI7DE6UXq+jCE9iWWKULC/2BpJLytium70aChntx4VQzKp7iKsmbUzh9cX6JITbAf0
	oRAmeVz40iu3SwJEeongKOUO83P/zqKaoJI2axDAgVmhZc3BTgzAdXnV4PnyvjVlHyD
	Jgs4hHZgc7AAgSz8X86fE6EtxPh4L9AeiotGSOELR93u1X/4yDx5xHw8Ly7i/KN+M31
	LMiPjmygUw==
Received: by mx.zohomail.com with SMTPS id 1780174624744206.68059972497815;
	Sat, 30 May 2026 13:57:04 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 31 May 2026 04:56:44 +0800
Subject: [PATCH 2/2] ALSA: usb-audio: Prompt users to check
 MIXER_GET_CUR_BROKEN for potential sticky mixers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-uac-edifier-mf200-v1-2-be69657c3f87@rong.moe>
References: <20260531-uac-edifier-mf200-v1-0-be69657c3f87@rong.moe>
In-Reply-To: <20260531-uac-edifier-mf200-v1-0-be69657c3f87@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

The UAC mixer core utilizes volume SET_CUR and GET_CUR to identify
devices with sticky mixers, i.e., consider a mixer as sticky if its
GET_CUR always returns a constant despite SET_CUR has been emitted.

Unfortunately, the methodology can't distinguish between sticky mixers
and working SET_CUR but broken GET_CUR, so a quirk flag
(MIXER_GET_CUR_BROKEN) has been added to tell that the device should
fall into the second category when GET_CUR returns a constant value, so
that the mixer is still usable. While the case is relatively rare, two
different devices have been reported as requiring the quirk flag.

Add an info message prompting users to check MIXER_GET_CUR_BROKEN for
potential sticky mixers, so that users can learn how to do some
experiments to determine what's going on. If the mixer surprisingly
turns out to be non-sticky, they can submit a patch for a new quirk
table entry.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b98222e5f697..a2a499ecd267 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1285,6 +1285,8 @@ static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
 		      "%d:%d: sticky mixer values (%d/%d/%d => %d), disabling\n",
 		      cval->head.id, mixer_ctrl_intf(cval->head.mixer),
 		      cval->min, cval->max, cval->res, saved);
+	usb_audio_info(cval->head.mixer->chip,
+		       "check MIXER_GET_CUR_BROKEN if you believe the mixer is non-sticky");
 
 	return -ENODEV;
 }

-- 
2.53.0

