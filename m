Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB45261B70
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785893691; cv=none; b=Li4JTGSwmS9/yw0fYjItgPE7JeiXgamc0EKB0UIu3EpLsElwu+d4lwLIhOEPJvDKkMZvE/zwiWe628UXO61C6ULM+cyGX+Yxl4OHEvzv3hx5OCcIgbeOE/5YWaPwL+oM9a0ngFL8MBngkaQnrd/wivS76nGmJNB46jprETognCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785893691; c=relaxed/simple;
	bh=AJuzXvTVkuXVly2Y8ZK0t17Th3ASi5G8hg6K20mj+/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1bFjOvxldOny6JjD3V3WDhVKXC4aheewNGEcvML7qFy9S95Bei+HYzSHHx9uGcy0Fk6ydBgedSoBtRBj8izfHU4YI0fykZCUDew9bZLQ+olC/m0sDY7NdZKGoW2BOea0Vqn/DOUPSN86Dn2X9hl9WdoYCxWeQMIplR6Ztl4sK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=Xh721U6Q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="Xh721U6Q"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacf197759so7183155ad.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 18:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785893690; x=1786498490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M89P75fJt691dQNC6UtNzIeiGuPM9Yb1WIZo+b/oH0A=;
        b=Xh721U6QTkDYXqkQYdBEn/9y6371RZZ/S+iVtFl6oVmQqoDwgEwDqZ7fV+Dx2W/9Ha
         QTGOLKBdpFRzoavZdnvPoifYWSqAS2VPulTkNUDvogs8TPfgcGQSJpdoDd8HaEuoUN8s
         TKpaZhJMY417qvTe3GxtTyxXLxli69btVL6yPHknLqfqkrHhYbOieN2sUz5W7Dd2h6Ds
         9DfJ0VIqsgQ8C2CVHMMYyetSmOs4P4REiEni31rqwdRv8JbbJmRx29S0Wa0T4YraQjRj
         CdlDWJIrURgV/hTxSWmb0HuMvZn6VCOug2YNsNdtYwvHFPJW50lKIf2SQcBFe3OJCCbb
         OZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785893690; x=1786498490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M89P75fJt691dQNC6UtNzIeiGuPM9Yb1WIZo+b/oH0A=;
        b=NbXKfRgtgAOW0XqdoCTe7roBYpGcna7TkW3x+EgYQff8HU+4zfnrc9csq/TEpb3KUs
         WNOjPXOaTCqbbLh4a5YW40D9s/ZeOa+0Q0+/x52cQ4cdwqhgH7nJ/auYTUeAwfzWmoQf
         NUVtJnJ6jZgP6Wh/x/at2ez4eWY2M4mISOWXky6xhlVuZ4fh87XZG0XdPZss7PuIvJMY
         HjvMjKbPYVLS/NzPN4qwO6pmOh9CkqSskwmdfnPTNRksx0hqGSFXK1sOqtQFs13rWdjM
         hmwoXfwbKz85UmDSnJPpO2h7MwdkDOOjcPlBxC/pwVd6NSUgfy0KYczWpDdd9cSXK+Wo
         qvRg==
X-Gm-Message-State: AOJu0YwZ7qrC3L288BmQnkMDWtW32+Sc/YIRIt/vbUL5ItZC5UeYLTxn
	4doNa8M7BqSSzKrC+5iTSxhZ81ZvA6HYpzHPoTLzrI/+jTGV2GPZwAPibhjCQPHA89s=
X-Gm-Gg: AR+sD11q8OSZ5jbBGugFMomRRtvTIBroP5RPadAhGpDI506PMUwgPBFSPYPJYV0qEp4
	sKWcimfIdCVmmb+uzLwTWhxBpqC9vWsLN4Bt+H0p53tEatEBKJOboIM1J0CL+IdBR8FysEEgpab
	kg/2HHXBcJkxiDkNq0547IH0NWl6JBrdhyjzHlVKXySWpRTuEajQJnZYQi5hf49un8xeE1bM9JJ
	snHGaqOT22n1xwuMKFmWgYZR7orNX5KnAC9GIGuMaqnHKkOY16Kn52NEtW5HvYKMixRaA/7goHm
	E4+gDZFnAZCcsZI+yP/w1y0M0Fe8ePIyNisiODGBbFHziwr7+4lIK+nD1rrPJjPHuIGv5VSuinH
	TAlN/hgSjarfrKvFbuFbHVO1xkoXAUGBjYY072jK20Z7a1uHk945iha2gVnorkQwjbvKr9YVFkQ
	eyrxDk3NEkm1oNcAOmCUCOLF8eXJMd3AWThQlkBt3qmGHU7QdTxljuKtkdcZT/TGcq5GlU517rn
	SgbzuR8M0AC5nOIe+HDkOo2hwH0
X-Received: by 2002:a17:903:19e6:b0:2cf:b23d:77f with SMTP id d9443c01a7336-2d0ca984ba6mr36054965ad.20.1785893689963;
        Tue, 04 Aug 2026 18:34:49 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4b9bbasm13275535ad.60.2026.08.04.18.34.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 18:34:49 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	federico.kirschbaum@xbow.com,
	stable@vger.kernel.org,
	Baul Lee <baul.lee@xbow.com>
Subject: [PATCH] ALSA: usx2y: bound the hwdep mmap fault offset
Date: Wed,  5 Aug 2026 10:34:45 +0900
Message-ID: <20260805013445.38283-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_us428ctls_vm_fault() turns the faulting page offset into a kernel
address with no bound of any kind:

	offset = vmf->pgoff << PAGE_SHIFT;
	vaddr = (char *)(...)->us428ctls_sharedmem + offset;
	page = virt_to_page(vaddr);
	get_page(page);
	vmf->page = page;

	return 0;

snd_us428ctls_mmap() checks only the length of the mapping, never the
offset, and us428ctls_sharedmem is a single page from
alloc_pages_exact().  For a character device file_mmap_size_max()
returns ULONG_MAX, so the mm layer imposes no ceiling either.  Every page
offset above zero resolves to a struct page outside the object, and the
handler installs it into the caller's address space read-write; the vma
is not marked read-only.

The caller picks the page frame with a single mmap() argument and gets
read-write access to a page of kernel memory it does not own; an offset
that lands in an unpopulated vmemmap region oopses instead.

A process that can open the hwdep node of an attached US-X2Y reaches
this after loading the FPGA image through the same node; no capability
check is involved.

On 7.2.0-rc5 (arm64), mmap() with a large offset:

  Unable to handle kernel paging request at virtual address fffffdffc45d5ac8
  pc : snd_us428ctls_vm_fault+0x68/0x140 [snd_usb_usx2y]
  Call trace:
   snd_us428ctls_vm_fault+0x68/0x140 [snd_usb_usx2y]
   __do_fault
   __handle_mm_fault
   handle_mm_fault
   el0_da

Reject any offset outside the shared region.  The pcm hwdep handler in
usx2yhwdeppcm.c computes its address the same way and needs the same
bound.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/usx2y/usX2Yhwdep.c   | 2 ++
 sound/usb/usx2y/usx2yhwdeppcm.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index 4d7925184826..7f153a2fcdd8 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -22,12 +22,14 @@ static vm_fault_t snd_us428ctls_vm_fault(struct vm_fault *vmf)
 {
 	unsigned long offset;
 	struct page *page;
 	void *vaddr;
 
 	offset = vmf->pgoff << PAGE_SHIFT;
+	if (offset >= US428_SHAREDMEM_PAGES)
+		return VM_FAULT_SIGBUS;
 	vaddr = (char *)((struct usx2ydev *)vmf->vma->vm_private_data)->us428ctls_sharedmem + offset;
 	page = virt_to_page(vaddr);
 	get_page(page);
 	vmf->page = page;
 
 	return 0;
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index 7c90214485d9..f1d5b4b797ad 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -669,12 +669,14 @@ static void snd_usx2y_hwdep_pcm_vm_close(struct vm_area_struct *area)
 static vm_fault_t snd_usx2y_hwdep_pcm_vm_fault(struct vm_fault *vmf)
 {
 	unsigned long offset;
 	void *vaddr;
 
 	offset = vmf->pgoff << PAGE_SHIFT;
+	if (offset >= USX2Y_HWDEP_PCM_PAGES)
+		return VM_FAULT_SIGBUS;
 	vaddr = (char *)((struct usx2ydev *)vmf->vma->vm_private_data)->hwdep_pcm_shm + offset;
 	vmf->page = virt_to_page(vaddr);
 	get_page(vmf->page);
 	return 0;
 }
 
-- 
2.50.1 (Apple Git-155)

