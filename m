Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0324E4C6;
	Wed,  1 Apr 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063944; cv=none; b=TpabCB5/xjTDnYK8+xaHt/JiV/O2/KUexIrUfDAMB6lmzlDHm8HMNL2BsH/+QY9rJBCUt2AZ+2nIqhvvRENALNXgKSWgBQSOAF2VWTA57FCl1cgyM3e2tCXiMjNwETgkNlCoOPQFEFHG+tkZfPKvsigAfiJG4FKInpsLlXbBlrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063944; c=relaxed/simple;
	bh=M+bVbssourcdFCDBjWFXjmwefz7AGX01HmgNDSTKY+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EEVFwpLs5Bja/Th9GuXBUtAHOkkB9+2S121rndjyfSWzIpIEsEITpTUUJAa661AqoUHMW3aYAa0nhxO2r7jfwbx0GLQ5VYZWqmP/5uZ+MgcnDoJ8axkFtURUzyPoGD7+/QaQfAFyAYHcUjfYnTTxmwGQQJcAdoCsPhpkcLtYtGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDhfO3Yg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDhfO3Yg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5989EC4CEF7;
	Wed,  1 Apr 2026 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063944;
	bh=M+bVbssourcdFCDBjWFXjmwefz7AGX01HmgNDSTKY+0=;
	h=From:Date:Subject:To:Cc:From;
	b=KDhfO3YguzoTJS1HkRDB5bXjhxd/j6iIIe3cYLrcuEfagpqey9T13NwqWGNbiIMe2
	 qy6GlGdUdTYkEd+7+rrg61rrjd7gVvzTP8ndxpCMhLJZ2ogfSHErR9j83/vaBsgOs+
	 m5EoCctcHbq/nVWmJnK3pmbXRPWH+k7UxlPm/3xLRdlAKEvl6dD/Pq1rWVwShGMa/M
	 Pbp5sBDNQZ1osex3RLeiCUb/JATF4Xt5xoXaxfDyA8KdlPFQ1pEpZz1zSqr3ffNqje
	 T+X4B70/ftD680BJXOQqhqOcKW+LbVutqzKlnwxAVCyeKYhaxUkUrF2j+OgtBs3k3v
	 IEL25QYAa2Q5g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 01 Apr 2026 18:18:03 +0100
Subject: [PATCH] ASoC: qcom: qdsp6: Reject pointer operations on
 unconfigured streams
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-asoc-qcom-qdsp6-robustness-v1-1-3a72991096bb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEpTzWkC/yXMwQqDMAwA0F+RnA20CqL7leHBpNnMYK02Ogbiv
 6/bju/yDjDJKgaX6oAsLzVNscDXFfA8xbughmJoXNO5tvU4WWJcOT1xDbZ0mBPttkUxw97T0LM
 LJI6gBEuWm75/+XX823Z6CG/fEc7zA/xm5S1+AAAA
X-Change-ID: 20260331-asoc-qcom-qdsp6-robustness-81b98c0dbe0b
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=broonie@kernel.org;
 h=from:subject:message-id; bh=M+bVbssourcdFCDBjWFXjmwefz7AGX01HmgNDSTKY+0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOFAcFXZXhGATV5nMn5yYhd8Fq3BDi7NyLC1
 6vbZUJ9jtaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1ThQAKCRAk1otyXVSH
 0KaPB/9gUogg9o7bqYR3roLLqauKpihkOPxEc2/lkEw6p1YYusrDViOAZuvupnO7I8n+9bCjMwV
 C/VGJujFcoIB2CvQg9udhqpXYRg1x48gBxYMSy+tpQZE98XVlmYu8j6H+ZTjlSZ56FDQzKjge0n
 gZ2UwvlV1UZO9yc17Q5MZ+8MpzlyUgcMLYoQRwJ0ew00QdlVlx9rgcKjJe/Gak2v6UBK7bzGPVP
 eZThQQWNxcjMVx01ScZVKMC1G+S8nuziqldn7ONKVXXlIlagIygYIpqB9jhgyhDF3RONZQEB3Gz
 BwNcdecH4cSLRJ2ZfMtyJ2lwiGBiFD9AEjjzloqLr5cPhwUe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The QDSP6 driver reports the current byte offset by dividing the current
copied data total by pcm_size, but pcm_size is only configured as part of
set_params() so if we manage to do a pointer operation before that happens
we will divide by 0. There is no sensible reason to do so, add an error
check for robustness.

Reported-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 168c166c960d..833d4782c68f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -582,6 +582,9 @@ static int q6apm_dai_compr_pointer(struct snd_soc_component *component,
 	guard(spinlock_irqsave)(&prtd->lock);
 	tstamp->copied_total = prtd->copied_total;
 	temp_copied_total = tstamp->copied_total;
+
+	if (!prtd->pcm_size)
+		return -EINVAL;
 	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
 
 	return 0;

---
base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
change-id: 20260331-asoc-qcom-qdsp6-robustness-81b98c0dbe0b

Best regards,
--  
Mark Brown <broonie@kernel.org>

