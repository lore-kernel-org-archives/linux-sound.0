Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759294;
	b=NV7GlnnEE5HDZGMTtmBqomV3F58EiDeb+c7XyBsuV96Xmq1LKD48AmWjNV66ybcsPTSH
	 8vBT7RekuH0djFtQTB/jXlhoKfcJeV5lGk01qXXzM7fi9C87W0nt7sQAZvJ8KfwgZOX/m
	 JjyM2bhlDkzwpfnP70dciatKABkmRdLr12eYdQe9L8SY+PkzQrvZxFeykNMU4bmGeKEHX
	 dM1ZgMmkmhfBiXYugxqYI71vycTyxBjSK9cbE/sg1KjxCd8DH613K3f/aHM6/Rqqe7cg+
	 Xis820JDPgx0+S2XzHsKoaI5oHYKuGyjIAj4F5lKqg6IqhkR77PSyxVwnGl4aRxFZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759294;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=UhSXZ+rOtmYd/J3haUM36IC8TZCxfDsQN4B2rqKAO4U=;
	b=10shKPn0bkZHg1JlF3tmRmGzOj654nDcEEwt60P6Wqjbe1bX7xMGgX43uyUPbVbTWzGD
	 lI436XtDLwI4zRYZ9mGaU4gxkg64ajL/I55GH3C0z07ZYXiI8m0GuLsJ1fuEUXBw2hVxU
	 /cmFYVre90tPMDqEl2GqkCAB8H1g1PZgw+SN6zwKVzcjWpw7tSqGrb/Cj7zlTj0OJbLbA
	 zFx8zEaxHh/dfRDBUuBfBGTeIHHRLiNcBTMgGwC/cwgfI7PcOpZ/xZ4dspfrejDiQCjEW
	 I5271ZjqWdRZyHjW8H9yD2N7IwgnizA9rfpfsWCPDPDuSq6aD5wp4XxPy9WZflY1AFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB8606A33B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DB8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsfs1mOpq0Js+AA--.9776S2;
	Wed, 04 Nov 2026 10:28:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ASoC: codecs: madera: release runtime PM ref on FLL config failure
Date: Wed,  4 Nov 2026 02:28:14 +0000
Message-Id: <20261104022814.1484284-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACHsfs1mOpq0Js+AA--.9776S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFykGFyUAw1DAr1fKF4rKrg_yoW8Xr15pw
	s3WrZ8try5JryFya17tF1kJF1jgrWfKay3CFWqk34vqw1Fq3Wjq3Z7t34j9a1jyr93WFsx
	Z347Ja48GF40y37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26Fy26r45twAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij
	64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUknaBUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMBA2rqY+TJlgAAsV

When the FLL is not already enabled, madera_fllhj_enable() takes a
runtime PM reference and relies on madera_fllhj_disable() to drop it
later. If madera_fllhj_apply() fails, the ENA bit is never set, so a
subsequent disable sees no change and does not drop the reference,
leaking it along with the device's active state.

Drop the reference on the failure path and skip waiting for a lock that
will never be asserted.

Fixes: 6535e831b4c8 ("ASoC: cs47l92: Add codec driver for Cirrus Logic CS47L92")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/codecs/madera.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 58255844b4df..2f6256f8e87b 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -4608,8 +4608,17 @@ static int madera_fllhj_enable(struct madera_fll *fll)
 			   MADERA_FLL1_HOLD_MASK,
 			   0);
 
-	if (!already_enabled)
-		madera_wait_for_fll(fll, true);
+	/*
+	 * If configuring the FLL failed it is left disabled, so a later
+	 * madera_fllhj_disable() will not see the ENA bit set and will not
+	 * drop the runtime PM reference taken above.
+	 */
+	if (!already_enabled) {
+		if (ret)
+			pm_runtime_put_autosuspend(madera->dev);
+		else
+			madera_wait_for_fll(fll, true);
+	}
 
 	return 0;
 }
-- 
2.34.1

