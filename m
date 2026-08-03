Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8113C1092;
	Mon,  3 Aug 2026 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748296; cv=none; b=fQ/bMln9bvz4Di6MWY8Rsh2cv9E8OSr4JJKJHBvj15gUSYluloXMIPE/nzZl7xKIURrcnYBeQPyZstL08pOeKRg4x0q2WHYC21mX5E/Qxcb5KwUdos+gM69+CbqiFs91q02VBAFDFSgfBJoh1pu7VynKmTxuYgY+bs6zo7BRwtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748296; c=relaxed/simple;
	bh=5mAV6KiTiFt+5D0BHTM/sod4vLpowHmzqBuJK3G4Igk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rU38yaYGOvvOj0HM5+ybvs/HqvLMWeWnfSa3xOpYYUpYPddx4XZaYUOeYAi9c7WKbJ3Oe0A978rTMv47yxBGszhaRCbqSX+xGWKVWqEZCYUQVoypVa6zdAjBdbPd2bLo+URsxAN6PrtCix+Z9isn4K3maJmWHcbfHVR34M15oCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=O11joKMs; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="O11joKMs"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42A7528055C;
	Mon,  3 Aug 2026 11:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748292; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VzOj30MJUMDUA68HK1wQnKh71eMBniRF626s4g/W9Uc=;
	b=O11joKMs3vNDJWuDpY9RR7gM5bGUtBzgj7riFtGupoG//g+U45AEhxfTFmLyQDH6emk4Aq
	F1WB0IRxhiaLUibvIIaMza8mF2urV2yzqXcKQw2je2y3fUY9M8b9a4vFkgESsrrp7psap7
	aNgcVytfRm3yIO+eRz3okA1iUqRyp1nx/LOmX5SO53r3sSexNBPfV3oircJ2rHCnr/WYcK
	gMv9eGVOPJ2+3r30oVAy9XA+MI9ELZX8EapvT15YEaH8fxJNQ5zeU+JzCRLWf+FZlhpGr2
	7k9ekVVcBJYQsK29RBVFiC+V8pFxM91P3zxGLZIZMx80bTMV8tR3/zipTrnO3g==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST
Date: Mon,  3 Aug 2026 16:10:52 +0700
Message-ID: <20260803091102.107570-4-dnaim@cachyos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

After creating ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST,
ALC269_FIXUP_LIMIT_INT_MIC_BOOST no longer needs to be chained to
ALC269_FIXUP_THINKPAD_ACPI and can be a generic quirk usable by all
devices.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2efa984a2193..c457ee9f61a2 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4771,9 +4771,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC269_FIXUP_LIMIT_INT_MIC_BOOST] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc269_fixup_limit_int_mic_boost,
-		.chained = true,
-		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+		.v.func = alc269_fixup_limit_int_mic_boost
 	},
 	[ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST] = {
 		.type = HDA_FIXUP_FUNC,
-- 
2.55.0
