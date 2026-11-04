Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760044;
	b=cxivxRBeCIh8jr5Un8CjEnxM1bndd9czepHo7q12uAe3H6UnQSX67purGAEpCLrCaJZi
	 M1qGysNXiQWywxRl/AYRZemI2xd2Uu47xvfd/3L4lis1eIEFiCWwiVJReIbRP/CFNSW18
	 HDRYs61xQ/CUORn+2BMPst3RpB/Eavm+d2FNYZ4Y4SiUXd9UjiT0YN1ddtuk0J4HcZVnW
	 uQyJ+i1YtH7+/pZy/ZigDPTZibpkwK5aE9CKrAyRegSrnSAeKKkKEQDSHNBVPT3G3g+8L
	 H2tPImMJDTUfD1Wv1XlIW4qWctes2cvgiInPODAJJhJmnS9KI+3Vgv34sYsvK4Ib9vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760044;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=KhLJLcO1m2xcoC0YmCMFCA+9gKgxhsMxQHBvYTHhPJg=;
	b=N5bbTspEEdK6Jgp6nnVw234q2Y3x+K9h9OfUe9SmszOTmnyxGAVcsZiJb98rqK0x2F12
	 4km6G/e+Q4nQSpYI84B4cpzSNf9wPmZ/5LtmZhGi65G2Wmwq4nSFZ6G2ksDV+jVZJTF8w
	 G6jdRQc30TL0lvH9iddS4+9gsNzWEVKk3PZ1YYh66WprXYI/aSHsCr1Bce9hI87EANY9O
	 rNa823HcnaF0k/lDkVeZ7iNlY0eY8H/mlUNlNwY6MW6hadNagBKxA6Z43RWY2twO80H6J
	 ll/aBu+FYBP78JOB1cyNG8NmjPmoFDSQoa0cNWzKBbxLxfU5mqLNfFWKyL3imQXKtUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F44606A338;
	Wed,  4 Nov 2026 02:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F44606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3H_olm+pqLbk+AA--.29317S2;
	Wed, 04 Nov 2026 10:40:37 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm-dai: close the graph when PCM open fails
Date: Wed,  4 Nov 2026 02:40:46 +0000
Message-Id: <20261104024046.1508566-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3H_olm+pqLbk+AA--.29317S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF4rGF4kAw1rKFyUZw4Dtwb_yoWkCrgEg3
	9Y9a4kX3y5CFW8Aw1kJr4j9Fyvqa17uw10qwnFqrsrC34DGFZ3X3ZxKrZ3uF1rGF48C3yU
	Kan5X34Dtan7ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5gZ2DUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAABA2rqY+TXGwACsH

q6apm_dai_open() opens the AudioReach graph and then installs the PCM
runtime constraints. If a constraint cannot be installed, the error path
only frees the private data and leaves the graph open, leaking the graph
and the reference it holds on the AudioReach graph.

Close the graph before freeing the private data. A failure from
q6apm_graph_open() itself still only needs the private data to be freed.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9f..6c0245e92d3a 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -562,6 +562,8 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 
 	return 0;
 err:
+	if (!IS_ERR_OR_NULL(prtd->graph))
+		q6apm_graph_close(prtd->graph);
 	kfree(prtd);
 
 	return ret;
-- 
2.34.1

