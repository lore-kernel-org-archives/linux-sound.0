Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E71922538F;
	Mon,  6 Apr 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461760; cv=pass; b=vFu4wL7zIYC9nS7wHxU0BNSbOUnKEWAFjZkHXnQtpeEG2cN18SwNlM4/mOkmzloOX6BUiFb4d93gdSEPsAVsAvoD/bZMgruoHFgGfAPeGPgQNx37i5SeXnESVN4v9feDNbbaCb8sc+LS1g95ORPkNJw6vpvoo3l1Re7xsVpED14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461760; c=relaxed/simple;
	bh=RQbTlEZiPap8jwszlD52VhIwEUD2ONzLUYGqypPswUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBfEVM5uvqPl8Wo0qQnr14bJCp8l55U/HvO8r3cvIj1neM+HGt7uBAZg2pnMO8EevnoOG0QTMKaAJJS36HJLnxnDzfpkIYwaCKANqx5SqUc/U0Y7Y68I//xzH+NYn2stuh3TzMuVofb7LonYmEBq4b269A4j+PmkGPUVnW+Hl/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=gJ1lqSzv; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="gJ1lqSzv"
ARC-Seal: i=1; a=rsa-sha256; t=1775461745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=loW1QbU1l/mmHdkpU1tEPEfDgxmVmni/GE7CSCgo+3NFO35Ej669maI61Ky7qLi5DHO9TVvoh5LPBoKg5hCxsqNR6cZj/oWTbsIOcAm21eIAKlRUVRrh8f7SAybm90zcLvhV0R3BDGgk4cjWs9apRlOtlhbo04cvBspPxMdC3RI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775461745; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5sfHEvSLzgU959xJwXcpI8LGJfw+4Ic67c4ZhR3XIw4=; 
	b=alfd/Ggpz26vgqyiPZCmKZ89hzmB4TJuqsbcREQvMyWzj2urvXCL0Y7j+t5fwA2tFAjBWGNChaH1Wr6mOMcn8ciDbhZmHQDpOeTRAsto1aiG/FIeiLSFYTK5KJX5LTrKb8vSLWL4PPPJ+3Mef3EvtbNKfVqAuWMo+lODsBZpxs8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775461745;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5sfHEvSLzgU959xJwXcpI8LGJfw+4Ic67c4ZhR3XIw4=;
	b=gJ1lqSzvSBJ+lL5GpsOtLBT6/y4OwtElqzispqkjdT4Rn1ADtb3s5TPD8kx1MCay
	U1z6FF1wDHFYeNy/FB14qgXNiLyrXamJGgHvZi+x1CeKLLnL4LUwoLtbWsz8stS8pqm
	dxPotxXGuR+E6LZ4kw+WjKaItRmSmH5DKOwz+xlym7O6WAyDEFvNDcHgrvOdyNbW2Th
	d/tj7g47FSiZwoyZr7nPd/ER4GjffM+nlQypFVhmmmFR/dbefVjFhVBp+JnvE+kYn8/
	eMc7D8dbjzo6RgQDmwaX6XSibI3z9vv5jvGKrMvPpnOotgxxo7KNC863ChKYEz+LwYf
	QL8/gwxgWw==
Received: by mx.zohomail.com with SMTPS id 17754617429841013.4603715298756;
	Mon, 6 Apr 2026 00:49:02 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH] ALSA: ctxfi: Limit PTP to a single page
Date: Mon,  6 Apr 2026 16:48:57 +0900
Message-ID: <20260406074857.216034-1-me@harin.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Commit 391e69143d0a increased CT_PTP_NUM from 1 to 4 to support 256
playback streams, but the additional pages are not used by the card
correctly. The CT20K2 hardware already has multiple VMEM_PTPAL
registers, but using them separately would require refactoring the
entire virtual memory allocation logic.

ct_vm_map() always uses PTEs in vm->ptp[0].area regardless of
CT_PTP_NUM. On AMD64 systems, a single PTP covers 512 PTEs (2M). When
aggregate memory allocations exceed this limit, ct_vm_map() tries to
access beyond the allocated space and causes a page fault:

  BUG: unable to handle page fault for address: ffffd4ae8a10a000
  Oops: Oops: 0002 [#1] SMP PTI
  RIP: 0010:ct_vm_map+0x17c/0x280 [snd_ctxfi]
  Call Trace:
  atc_pcm_playback_prepare+0x225/0x3b0
  ct_pcm_playback_prepare+0x38/0x60
  snd_pcm_do_prepare+0x2f/0x50
  snd_pcm_action_single+0x36/0x90
  snd_pcm_action_nonatomic+0xbf/0xd0
  snd_pcm_ioctl+0x28/0x40
  __x64_sys_ioctl+0x97/0xe0
  do_syscall_64+0x81/0x610
  entry_SYSCALL_64_after_hwframe+0x76/0x7e

Revert CT_PTP_NUM to 1. The 256 SRC_RESOURCE_NUM and playback_count
remain unchanged.

Fixes: 391e69143d0a ("ALSA: ctxfi: Bump playback substreams to 256")
Cc: stable@vger.kernel.org
Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctvmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/ctvmem.h b/sound/pci/ctxfi/ctvmem.h
index da54cbcdb0be..43a0065b40c3 100644
--- a/sound/pci/ctxfi/ctvmem.h
+++ b/sound/pci/ctxfi/ctvmem.h
@@ -15,7 +15,7 @@
 #ifndef CTVMEM_H
 #define CTVMEM_H
 
-#define CT_PTP_NUM	4	/* num of device page table pages */
+#define CT_PTP_NUM	1	/* num of device page table pages */
 
 #include <linux/mutex.h>
 #include <linux/list.h>
-- 
2.53.0

