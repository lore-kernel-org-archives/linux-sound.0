Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028665;
	b=2RAUDwPE+3j/tkGiKyK1Frpgn/AJFRNYv/ATt86/SpFOkhVhcdbC/ABXtJO2A6dAKuML
	 XlCPvmOJdaLySTGXR1n7MeE9EH+M28aUbI7FPtV3MkN4OwgrNLUQpiAfZgR2JGf4vc+gh
	 6iic7GKLuMI7xI8Avv0ftxS/pFXrJ+Nevq28W05Y/t/5Q+9e2XExI9bZEvTRFb/bG3f4I
	 rT1yzCB63QJnDWByEWXUnt2bKCpyJ33ERQRfmBlCjz5t6zPB+7EVFQjaSZchXwPgpi3u6
	 ZpB0erI/T+Vbcq9pYXAD7Co8qj5Dx7ujKc1x89J9yZ9qIZ00AsMNt++c1nYbCLUu4Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028665;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/mdaoPvgDGOomHiuNztOPyjvJgjRR6sroJzXjJQJnKE=;
	b=BKYTZTnEMkP4xGcX4WGp2QoPx4ofutDEDHeuzohX1P2Llv13+W/EvRLl5tlQRL2LBwGu
	 w2HA3IWwEB6a9Bn/n8kNWr/OgoHMFjFEbh/I37z80kY8QCgwCw7+xm7ZmGBb5E2jnh5+A
	 P/KYn9x8up73NJSBYi8kczd+aEqqBKOaUbEeyWWelXvdw0sct8DjZEe070i02/CqebCfa
	 Rhk3eX4pLZtF9g3JXsAg8AZaZg1eoIn94PUZZFDJ/DcvR81U1MXbF3U+MObPSq9rF3LBI
	 od3SiwSSz01lCqJ7rkbX8/jV9hfbm5NT9ESZACemd5n1V1v0/nFGmx0mbk3VRftsZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=XSr3hGGW;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEEB606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EEEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=XSr3hGGW
X-Virus-Scanned: by amavisd-new using ClamAV (4)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028663;
	bh=/mdaoPvgDGOomHiuNztOPyjvJgjRR6sroJzXjJQJnKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XSr3hGGWVqqiEmmeURXHQuieMgY1dDnHzqmRJOouhA38ImsHfjnr7Qt47U/vTUawZ
	 7EK7piofUexInjLlG14pZL6E8Y3bR/JyAPTsh21uPN1WkFwXClzYeFqWOmbn+GqHq8
	 n+KmjeeI4i3YSTK21UIhdAED89STztn0BgdyIDnO5IJUy8S/o9MKPyGIQEDZVHJ4eH
	 51eowz4OwtHG4dK6YJO5i/aktfdNIBnF/ALKeHqIug2fBKvfWt2HciwUl/h//ikDTf
	 vHFYSoLrvytl2HTP2685DBHMaIOz8Sk4kqOtOWc622rlQpsSU1wDK6Or9kXcG0b1F0
	 lcRQgsVjUsNhg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 827571BDE45;
	Wed, 18 Nov 2026 20:04:23 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 20/22] ASoC: qcom: qdsp6: Remove orphaned audioreach_map_memory_position_buffer() prototype
Date: Wed, 18 Nov 2026 20:02:17 +0100
Message-ID: <20261118190219.316811-21-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

audioreach_map_memory_position_buffer() was declared in audioreach.h in
commit 7c1ac23b178a ("ASoC: qcom: audioreach: Add support for shared
memory push/pull modules"), but was never implemented. Remove the
orphaned prototype.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/qcom/qdsp6/audioreach.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 587f14ce71d2..0a50b9337738 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1047,7 +1047,6 @@ int audioreach_compr_set_param(struct q6apm_graph *graph,
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
 				phys_addr_t pphys, uint32_t mem_map_handle,
 				uint32_t pos_buf_mem_map_handle, uint32_t size);
-int audioreach_map_memory_position_buffer(struct q6apm_graph *graph, unsigned int dir);
 
 int audioreach_shmem_register_event(struct q6apm_graph *graph, int bytes, int num_levels);
 #endif /* __AUDIOREACH_H__ */
-- 
2.56.1

