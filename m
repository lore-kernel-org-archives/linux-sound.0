Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5617A303;
	Tue, 24 Mar 2026 04:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325729; cv=none; b=tgTZnkJ8CGyWN0OFCyWwDRdSIOxH1EjNAgnYk/RdnD4R3lU6/8O+TyRnxmnuRt01Yw3Pats+G9a2g8g4Lls0KeCwQWAjTI+7oOmUm7XvODVqeddScGtS7znc1QMQsRra65GW0plQi8cp0V2lMyGYtJnZixABECLkFd2lWzQ7ep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325729; c=relaxed/simple;
	bh=o1kPp+YmrzLnvBjVsQjymhTVDPQnXLejafpownlnGuw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gUrNKa57UndtNeo6qjleI7iFqHrd0xhDfHJ+5K9KbrJKar8NS6c+OK1+ckEdVtpW4bwzf4Rh03oV37gMyICqzaKYCs0X1doR5PEPw3BI1gz+Zny4PlftJxzUXjKOBDV7WlGn6pQHmDFS8hynabnNLWPflhO3sn4a1UzQkqELLWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=ZaWX8PNi; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="ZaWX8PNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774325697;
	bh=aWjpVefODVGfVXeL4Actfzq6NNc7ecramkA8bo/aSVM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ZaWX8PNi4EKjy9RdA7G57RsL3sNY/srjIAXN5SX1HR2hx7zAzAtFI9YKM6XLvV0pb
	 bqH2mGqw9CtFPjoF5PWdxp/TmJMrHXyCuSV2Bt5wooJjWZYsdWzj1aTHF5f/K10VtQ
	 /cqxxLE/hllt//srjDIKQkSYtVbZyVwScSv7YjaM=
X-QQ-mid: esmtpgz12t1774325682t71fc2e62
X-QQ-Originating-IP: y39DWRFR+KvMsH7cahujPSS/bVwFdVvQK2xZT0ODzzY=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Mar 2026 12:14:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5138743655956083736
EX-QQ-RecipientCnt: 17
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	kuninori.morimoto.gx@renesas.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg,
	Kexin Sun <kexinsun@smail.nju.edu.cn>
Subject: [PATCH v3] ASoC: update outdated comments for removed snd_soc_new_pcms()
Date: Tue, 24 Mar 2026 12:14:00 +0800
Message-Id: <20260324041400.16217-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8c20f43f-be8e-4a03-af80-9c91a4a233c6@sirena.org.uk>
References: <8c20f43f-be8e-4a03-af80-9c91a4a233c6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: NFNrK8KlcSCR92bIJ3lJdOKcZwuh2EJNgHiRNEPMulr+YTY50YC9sMFe
	0thcEHSYS9jBaNez1ymgjiTZs6O9IMXlMYeNcI9+KuxX3Y6bD6lI5XZETxquwdY7tpOVJdI
	FQd3kFzy5MftuVQwgP7szokS4mhfurEtL0aNRb6qJ8VAdUXPN5dRvKxKtx6WvQpE4i0+Vq9
	qWwuoHqzjlgDSJNAN0iKbNVxcmqMA12OwkF0lLFarQ08B3d9/temv1S1QYv3f+LUlXscoS0
	+dPEthUD4oJU2uhy8JQ5bwCVvTbi9/lyZbRxCeNrzrkJkjBzXPvtI29r5yFBeqKYVu9jQGs
	VsMkwptd5ZpwZQT0IXfWVwtpumxpFn5V0O9ub6oF76I/TEc3FvZcaJSazmrXuSdc6QKUcRD
	y6qOWRtSpq+F/+UgBdm8P6VW4j+TBENAtADwuYXbBIo5gTGpervSU+qvmlAbbCzgMphXAeF
	t7+9j2SZ51xL+dt6edLgGys4ovKPIB5XivpV1hkkJV+Z+ZIiFkaGDWmCLvRH6m8WCFopBFo
	avAcOgQgBSpT3/k2tyMevSExPla/jNFiPpUGp8MrbrS5xsK+qwWWGK2miNWF25nkeqaH8ed
	zBDn8gbVRIkoHN5eNT04DZBW3NcOm1aIaSpfhPhZFCfrNleezAKxtEEbyPmV4Zokko4Ki1g
	lMt9hpMLLBi5/l5y006Hvqu9EdWVcOnpecqUX9XRbuQQgD07F9WYPIpeAyMBp6Vh5JFVhmU
	7YJl8MwW0fSZkRojbYiI2RH5/FqchTDLy96LphvOnzYdyJr68iUnjP9wuDYjxjz3nl3C6qa
	f7jMDWjNFxxdCU4aknNcDvpsCufrQccstFuXNiLHnvrstUz2P2hUGozGGkW94XWcLbPcBkE
	Gx+E9GuBEFz5zKDIZIsE/sUeRHnglFj2DaEm/2mkVJ40A/FzjJgJt/JKdgdECsADvCPErDM
	WbQayN3ZlgbnVPRkX1lmcnm5D0RaO4SE2MbrRMROyhaDJzMJylUW2vNTKz0lWM2EPHtD/wO
	rtKbm2AKqabOw0stU4MTLZLO2e4Bd/uOA7xxe0yuAzoplgKKjJ
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The function snd_soc_new_pcms() was removed during the
multi-component refactoring in commit f0fba2ad1b6b ("ASoC:
multi-component - ASoC Multi-Component Support").  Its PCM creation
role is now handled by soc_new_pcm(), which was later moved to
sound/soc/soc-pcm.c by commit ddee627cf6bb ("ASoC: core - Separate
out PCM operations into new file.").

In fsl_dma.c, update the comment to reference soc_new_pcm().  Also
remove the stale paragraph about snd_dma_alloc_pages() always
allocating in lowmem, since commit e159704f7920 ("ASoC: fsl_dma:
Use managed buffer allocation") replaced that call with
snd_pcm_set_fixed_buffer_all().

In siu_pcm.c, remove the stale comment referencing
snd_soc_new_pcms() and the no-longer-existing socdev structure.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
v3:
 - Drop "via the pcm_construct callback" from fsl_dma.c comment (Mark Brown)

v2:
 - Also fix the stale comment in siu_pcm.c

 sound/soc/fsl/fsl_dma.c     | 10 ++--------
 sound/soc/renesas/siu_pcm.c |  1 -
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 26ddbe867b58..1facb7bf0b77 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -267,14 +267,8 @@ static irqreturn_t fsl_dma_isr(int irq, void *dev_id)
 /**
  * fsl_dma_new: initialize this PCM driver.
  *
- * This function is called when the codec driver calls snd_soc_new_pcms(),
- * once for each .dai_link in the machine driver's snd_soc_card
- * structure.
- *
- * snd_dma_alloc_pages() is just a front-end to dma_alloc_coherent(), which
- * (currently) always allocates the DMA buffer in lowmem, even if GFP_HIGHMEM
- * is specified. Therefore, any DMA buffers we allocate will always be in low
- * memory, but we support for 36-bit physical addresses anyway.
+ * This function is called by soc_new_pcm(), once for each DAI link
+ * in the machine driver's snd_soc_card structure.
  *
  * Regardless of where the memory is actually allocated, since the device can
  * technically DMA to any 36-bit address, we do need to set the DMA mask to 36.
diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
index f15ff36e7934..189d7e6f9750 100644
--- a/sound/soc/renesas/siu_pcm.c
+++ b/sound/soc/renesas/siu_pcm.c
@@ -483,7 +483,6 @@ siu_pcm_pointer_dma(struct snd_soc_component *component,
 static int siu_pcm_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
-	/* card->dev == socdev->dev, see snd_soc_new_pcms() */
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
 	struct siu_info *info = siu_i2s_data;
-- 
2.25.1

