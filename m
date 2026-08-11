Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F332C0F6D
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 04:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786422087; cv=none; b=l/CESGha6m9tVsYJzztTLyZOAogu/06qrzBqTJRDTMlHr9pnOMBrOBlauW+5pB9Imwr0PR5LKu7v6yMzsbCHfVudPtio/bO6BKwv4MFK0HFxB/ykJF2ZhwJjuOgLx9erRoATj9YgWXfxDVZ+72L5B5i5TkOdym0MNR/pAm7V7Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786422087; c=relaxed/simple;
	bh=UsMZNAyOu94pnIuYwaTgqfFMzgFNsEBuDeurzlzhPv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kA5pJb+E9Ebphikq9httqm3/ml1kIEvt6Hpur6e3XZBgWicDYmtTDC4swWxgDKPJOd9FIVmtK+2lrU1GkJFSlaIk70a5PLUF7EPMoULYm2VBwhs9j7uLrpTPkR2D/dHAWi6bkTF8h86Vui1uTF/29KEAmUKj5Lq0tT4DvmcZp3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+80P/0D; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+80P/0D"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c8e2e39easo27014941cf.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 21:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422085; x=1787026885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=trArl9+tT/ayTAiZfIgCD45Cj7fZExgNzjQorjwPpZw=;
        b=U+80P/0DOP22P7j/r8XKp9FkJ7FN50dAdKTiFfXuwIKAu9SqMjef3qSztVKOQ3O1Qo
         hP88ifzMP8ZSj6WApT+nTxPbGMH/TkY3weicmYCPFutu6sxJp1G8XKNVobgZG3Vb4D6J
         vyYLi5BoRjH8TKsVEJafUZh+BG7euPOve0ZgOrUtdwlcMiseDO52Dni+Ys6cM6id1xN5
         AiDfwJ0+OCkpIJV/KLSkCL4oDiJQtHnBS8GVNuC6osUddBvvBUlSlpLQH6YDud+D2NvZ
         pS+raQlg89h3x9vp1gqF4M1g30e7+uOjMJhj88e5TcMIFl8C1HmsCF8GOovKZ1GAU06J
         zcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422085; x=1787026885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trArl9+tT/ayTAiZfIgCD45Cj7fZExgNzjQorjwPpZw=;
        b=WiOU+Xue2tG9JLlKioqG8nQVZB8+VrbmPnk4wkPlwhkXDxua83oMTNEQ3FCE8sJ67j
         Ck9pceIPYJIaauGTfLn2+JBjbYP54SdbUspYFun14YCCiP0ZKeO5SQAZRFrXheevxT0p
         QwktpgHpEt6Qm+t5jlxOjybfE1HyGw82kRzU+QYvC9Zv95OYBb7wRH5zSqgTtIKqKSoT
         fwsFQHGNj6s+V9050cIkDTqHAAhG5jBN2WpmeKkV2vBuzwE6MnVfL3TsbV3cDGZ19aX8
         YWjxr9JCg0P1IBqO9du1yXkaFefe1ffii8r+gAjq6BKZzaT0/zefji7QqQgefLz4YUYP
         fCFQ==
X-Gm-Message-State: AOJu0YzxlvIMQZz/fMjza3FnsZZsg1kkN0GHT63aAiwKxAXikvCx0Pal
	pomaLGWcoE8buC6SK0ebRUTL74lz6d8MJL3xRLgva+gXvKFKACO89ltEN3Bg9A==
X-Gm-Gg: AR+sD11hquNvimIJer0iIo3lam6p3gPDhJpxB+IsWREaiSUGBDwPMWTYGZzwreUz5VZ
	nAQvqpmqqwd+v4RNXfo4CFdDo1QdJGN7OYD2Z9kzjQs3QMWYOoUbQltz3whVTgGrJAeTVlqR5Ow
	Iq+GhLAgG0suX2aJTO9FGZqzR81cpOWsusZ7ZEPCFuoNgmRzmj7MM7/pCLbPGIxHeSfWRHrf7Dh
	P4CFZZqertJVEAGdNoE0H4YwJ85z8q+M6NLJEqS9h4KFjoEKxed7190mzHdKP1kyo4hNSiT4/mT
	tHvPt4B/AtQUPe0RA8MH76zGAWD8r/5VHDJEq7ZeB3R0qcbH0QnFaIvqvTAGWpBY7Q7wEvT7FCu
	TpMEHHoGwvR0kPPjWcqs88POG19KENTzXGhiOUPMhUWyqRjiRoMkwvbJoXeX4L4U88jE7vZs4aC
	hU40KX3dSDafSaDqL977Twtk63Drwy7zpqs/fi2rukpkB6/t+s4dXZEU5bbCEm7lMf05xNYGg19
	yuUmEnmKQi7s8+JXpIK+Dhtzdol6kJbhsO26EfWEVbEvpfWibMR9HUYJVN+lLvPXLOZuCT4YSEw
	WiupzTR9w6A+gt+thIPGM38JWj5qWrqShiZWXQ==
X-Received: by 2002:a05:622a:53c6:b0:528:3142:d466 with SMTP id d75a77b69052e-52d586c8d67mr5003471cf.41.1786422084924;
        Mon, 10 Aug 2026 21:21:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6646ef03sm1745596d6.4.2026.08.10.21.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:21:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] sound: pci: asihpi: use pcim_iomap for managed PCI memory mapping
Date: Mon, 10 Aug 2026 21:21:22 -0700
Message-ID: <20260811042122.44923-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual ioremap() calls with pcim_iomap() which uses devres
for automatic cleanup. This eliminates the need for manual iounmap()
in both the error path of asihpi_adapter_probe() and the
asihpi_adapter_remove() function.

The pcim_iomap() helper is cleaner and less error-prone since it
handles unmapping automatically when the PCI device is released.

Assisted-by: opencode/big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/pci/asihpi/hpioctl.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/sound/pci/asihpi/hpioctl.c b/sound/pci/asihpi/hpioctl.c
index 9de9ae7032b8..ec2da792e1c8 100644
--- a/sound/pci/asihpi/hpioctl.c
+++ b/sound/pci/asihpi/hpioctl.c
@@ -385,8 +385,7 @@ int asihpi_adapter_probe(struct pci_dev *pci_dev,
 		if (pci_resource_flags(pci_dev, idx) & IORESOURCE_MEM) {
 			memlen = pci_resource_len(pci_dev, idx);
 			pci.ap_mem_base[idx] =
-				ioremap(pci_resource_start(pci_dev, idx),
-				memlen);
+				pcim_iomap(pci_dev, idx, memlen);
 			if (!pci.ap_mem_base[idx]) {
 				HPI_DEBUG_LOG(ERROR,
 					"ioremap failed, aborting\n");
@@ -509,13 +508,6 @@ int asihpi_adapter_probe(struct pci_dev *pci_dev,
 	return 0;
 
 err:
-	while (--idx >= 0) {
-		if (pci.ap_mem_base[idx]) {
-			iounmap(pci.ap_mem_base[idx]);
-			pci.ap_mem_base[idx] = NULL;
-		}
-	}
-
 	if (adapter.p_buffer) {
 		adapter.buffer_size = 0;
 		vfree(adapter.p_buffer);
@@ -527,14 +519,11 @@ int asihpi_adapter_probe(struct pci_dev *pci_dev,
 
 void asihpi_adapter_remove(struct pci_dev *pci_dev)
 {
-	int idx;
 	struct hpi_message hm;
 	struct hpi_response hr;
 	struct hpi_adapter *pa;
-	struct hpi_pci pci;
 
 	pa = pci_get_drvdata(pci_dev);
-	pci = pa->adapter->pci;
 
 	/* Disable IRQ generation on DSP side */
 	hpi_init_message_response(&hm, &hr, HPI_OBJ_ADAPTER,
@@ -550,10 +539,6 @@ void asihpi_adapter_remove(struct pci_dev *pci_dev)
 	hm.adapter_index = pa->adapter->index;
 	hpi_send_recv_ex(&hm, &hr, HOWNER_KERNEL);
 
-	/* unmap PCI memory space, mapped during device init. */
-	for (idx = 0; idx < HPI_MAX_ADAPTER_MEM_SPACES; ++idx)
-		iounmap(pci.ap_mem_base[idx]);
-
 	if (pa->irq)
 		free_irq(pa->irq, pa);
 
-- 
2.55.0

