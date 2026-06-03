Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5612C37F8BC
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509492; cv=none; b=aHAQpnjwVZ/2cZLHOQccL6bvam20fx8s52K2oWjKyrQPTj1fdvJxE2+wwv9lXaNQWYVrWJeBbF8fWvqNUiN1+kNOpKX/rbjXVAlF6KAad5hGHPw3kJTZ2YU8X+tA4buOR/kZNdiJNeTKyfNXpPCWGngChF+sxoWkg5ggQXaafbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509492; c=relaxed/simple;
	bh=8JgR3faeGlRVPEBTlS0J0PeFqUo9krPvX03s9XENbGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a4i8z6Vp16yi5WHeQkWd8xQF03wj9JjFvi2TlSZRH8mKJ1fYDF/dchoqM0Q9gYzr/TvrhxGS1HoTOKhmajUYajNBOBkb6lSPRdxykqMA5LZYJFx+VzFeSBHq0bW0DIKov03407cx9mTaiSBDlXCS+UuITlenhD2l1LyZ6X+My7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9WUHN0R; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9WUHN0R"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304c520fe9aso2945537eec.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780509488; x=1781114288; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KgSUwufu0DBM9d4er96QRPnvOskLS4/KoB1eLfgcG28=;
        b=S9WUHN0RFlucny6IQUnGH9LQAFL3ejs90uZsfiyWqFipXfxGfbGztuuujtwfVipifO
         fqn+Z4FGoNPEqLsxpOXb8RoGLChteD0j6H5/MOuDa1+iG5lf6zvtGvRR88cDhjo9m389
         f3JR/VHVuXZOkBMYNN5rsISvXUzQ/Hc7MvQ7eYT3Z2sGSL83iNY1icOHrAmkBgfX7eUl
         ID47n4AUQSDBgRJfJ9xQjoJzeotd1CzHvzqlmAg885Vkxrgoc4wE6r9hF53PZ3ioDGxh
         cfAxzVwHA1tN2HlJTmW3rJP8oYepsoAgYl96UROlTQI/ebfZhmXZqLSHIwLQU1dYQ1XL
         L63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780509488; x=1781114288;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgSUwufu0DBM9d4er96QRPnvOskLS4/KoB1eLfgcG28=;
        b=I7+kp0Xbkgj4QaeT5yfYmMWAF5+NhKTwPFhZKCcVAosp1m0Ll9k5KTKHse1ihBbhP2
         JiN0rPDaLvB4fdDjJXPl1FOhBOK89hksfLkKyJbBcrkYKcIrELDXvmeSpCO1L13iQij0
         OnkTy5gmT/DHxxogcJ088I7MexCQWg0tCd9IKInwGYB214FZeyIWMrzgqQ06q/HP7oy8
         WRWpsWReW0Kyuyzs1Hbo1QEf77YgektGgTqUFss29H19XllAQSamcxssBah+QdJpQgbj
         zO946HjyIX9uvYhQa8PNva+aXPt9KKtZYyXQm2cLBsJ2z+HVNNicv6uDD5Qzci9dt6er
         JIMA==
X-Forwarded-Encrypted: i=1; AFNElJ+Qhs5pjyfsdw5mdo5b2Jl9136CLs5RTjnxCWxEHkN0jmjnrpz+sY0SkEjUdYbpIkUhgbgz7KLRRzkMiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTY+6dA7O90WgixLpA9XgddUoiHSiyJsFUCQx8OohP8x/dklJ
	7/GpayE83R+e9wfY2IuusYSJHEDHeMSKWRziqsxLmufNMyas8mkE827p
X-Gm-Gg: Acq92OF5M3rPhLdYVflJqHNvjEWPMnZ8ra2EnLX2ey5FVyUtbRKmQqtJazetBGfFIqF
	puQkH5P8o7/3jDSvvhYIvC+5PQhM1I/SVzE97RWFeycg8VC/cVxVICOMj/m5qhZqUdjeAnFmf1M
	o2Sc8sL4KslywHDBLALSTaNNBRGdPv6NTIBP2S/iS5BZm2PNnLoVL+pO7+7aXNe3RRyhrytAWEz
	k2hq+DmNRGWccr0ZU+/cYLO2KHxdc8G/9p7vdvOHVzveS3YNT0tqdBWkitgJZ4B8Gikh2q9rZ8p
	zZsT0fg/XBHAwDb6ET98gNW9ntSG1E7aHwqbOwQJ9EaKYPhPH6zC00VOYdDtRM77Y84k43oIMFU
	CMDFQAYsVEaUsevYTT/PkbxfMcPnkTs53no4KtWrCCHmHVtVKy2FQSML55UTR2IOsY7LAZ98Cr2
	3MSErHNeOU+cmNhpA1bDQKbg4BvQ/gSEjxIWnSMSQHoBqL98awZ/8ko8+0cWRWKbHzT95M1KWOm
	e961e3EJawm
X-Received: by 2002:a05:7300:dc8c:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-3074f843547mr2258920eec.0.1780509488123;
        Wed, 03 Jun 2026 10:58:08 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db56697sm2956046eec.2.2026.06.03.10.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:58:07 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 03 Jun 2026 14:57:54 -0300
Subject: [PATCH] ASoC: SOF: topology: validate vendor array size before
 parsing
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-sof-topology-array-size-signed-v1-1-84f97879a4ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTtJgcjCqxgX03aoY0xLZpCIh
 LtTdfOSb/O/DYxV2ODSbKC8iEnJFe2pgXCnnBglVkPnusGde4dWRpzLVJ4lrUiqtKLJh+ukzBH
 dQD5S8G2IAWpkUh7l/Tu43v62l39wmL9V2PcD3NazP4IAAAA=
X-Change-ID: 20260530-sof-topology-array-size-signed-06abdacb1cdc
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, notify@kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=8JgR3faeGlRVPEBTlS0J0PeFqUo9krPvX03s9XENbGg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkK2eqvr9u/OWZ8JK0wRPrenwvXg6cL833m9A+9dPrQ1
 DXnOVv+dZSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEDLczMhyY/SXmeYvo/K3Z
 flenOqTr8HNN2f2iX3LJsSkLO4Wui6cz/JX96a2lbq2tcHO7393dR04EyOqaey6SNt627k77PjP
 7F5wA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

sof_parse_token_sets() reads array->size while iterating over topology
private data. The loop condition only checks that some data remains, so a
malformed topology with a truncated trailing vendor array can make the
parser read the size field before a full vendor-array header is available.

Validate that the remaining private data contains a complete
snd_soc_tplg_vendor_array header before reading array->size.

The declared array size check also needs to remain signed. asize is an int,
but sizeof(*array) has type size_t, so comparing them directly promotes
negative asize values to unsigned and lets them pass the check,
as reported in the stable review thread reference below.

Cast sizeof(*array) to int when validating the declared array size. This
rejects negative, zero and otherwise too-small sizes before the parser
dispatches to the tuple-specific code.

Link: https://lore.kernel.org/stable/CANiDSCsjR5NHqu_Ui5cOqWdJgFqmYsQ9WR8O7m0WOhngaYXFpw@mail.gmail.com/t/#m9b3be379221e79327cc13fd71009287368ef4f23
Fixes: 215e5fe75881 ("ASoC: SOF: topology: reject invalid vendor array size in token parser")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/sof/topology.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 8fc7726aec29..bb6b981e55d1 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -740,10 +740,13 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 	int ret;
 
 	while (array_size > 0 && total < count * token_instance_num) {
+		if (array_size < (int)sizeof(*array))
+			return -EINVAL;
+
 		asize = le32_to_cpu(array->size);
 
 		/* validate asize */
-		if (asize < sizeof(*array)) {
+		if (asize < (int)sizeof(*array)) {
 			dev_err(scomp->dev, "error: invalid array size 0x%x\n",
 				asize);
 			return -EINVAL;

---
base-commit: bb451bc01ea42c9e47557638400708e20df34178
change-id: 20260530-sof-topology-array-size-signed-06abdacb1cdc

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

