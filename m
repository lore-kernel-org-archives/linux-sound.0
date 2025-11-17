Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87923164AB;
	Mon, 17 Nov 2025 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362626; cv=none; b=Emx4s+Q8rA/XlXE7cXO5VzSKX8O8CIFhCxdg7Hxpky3GAiQWYVIiov1hhkVYldVKUeVDGUvSTGAgRn4RGrnhenQrUl2H9A4Rr9NKlMvfFh9sXH8DpPvrEH1Yu50HWYrr+M+3muOJ6os0S3WtdRYjKxpIRbpzH2Ghfb03YR3Zb0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362626; c=relaxed/simple;
	bh=Ga7rOzWuBgfQd+1pgy1FhPOXbTMMW06K0GjV607H0wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9uSYFFV3fin9I9P21HtqWVCu+Rle8ANTk8sGg0+tAqSumZMjMi2fsBt+hQhxs+iT4+E68k/9oGF7c1DgnNx1DMGUOGvoTXD0m4oZaA+G/hZ/52clgAMMj1qTahrJdQj4lLfw5MDoryZpqHwdvoapMmaGURV/xx1UpbSWsZ9cWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABXU2Qvxxpp78sIAQ--.25207S2;
	Mon, 17 Nov 2025 14:56:49 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Philipp Stanner <phasta@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] ALSA: au88x0: Fix incorrect error handling for PCI config reads
Date: Mon, 17 Nov 2025 14:55:59 +0800
Message-ID: <20251117065559.1138-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXU2Qvxxpp78sIAQ--.25207S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GFWrAr48Wr43KryfJFyUAwb_yoW8Jry3pr
	sxG39IyFZ3Jr13Cw4kJayrGFn0ka9FkFWjvF48Zws7Awn5AFWUAF9xGrWagr4IkrZxW3yr
	XF40qFyrCa4DJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwJA2kag5f6yAAAsV

__snd_vortex_probe() uses pci_read_config_word() that returns PCIBIOS_*
codes (positive values on error). However, the function checks 'err < 0'
which can never be true for PCIBIOS_* codes, causing errors to be silently
ignored.

Check for non-zero return value and convert PCIBIOS_* codes using
pcibios_err_to_errno() into normal errno before returning them.

Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/pci/au88x0/au88x0.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index de56e83d8e10..bb02945793f0 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -280,11 +280,11 @@ __snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	// (5)
 	err = pci_read_config_word(pci, PCI_DEVICE_ID, &chip->device);
-	if (err < 0)
-		return err;
+	if (err)
+		return pcibios_err_to_errno(err);
 	err = pci_read_config_word(pci, PCI_VENDOR_ID, &chip->vendor);
-	if (err < 0)
-		return err;
+	if (err)
+		return pcibios_err_to_errno(err);
 	chip->rev = pci->revision;
 #ifdef CHIP_AU8830
 	if ((chip->rev) != 0xfe && (chip->rev) != 0xfa) {
-- 
2.50.1.windows.1

