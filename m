Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D54657CF;
	Tue, 16 Jun 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611178; cv=none; b=JCtJqma9mBa194azT5XA1Nrl623EwBFRS0WtP4N1HVh8Vm80rnaHmQd8rrIoD06gu8K5Cgg0xJ9SH25E9t2aUNrkFVW8luWb9fenAtCZ15WlOtYEBrEDu6Hc0FTXraxhc43zAJUa8eMn/mU8TXhngoQ0a76AvQ9iugyJd07/lP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611178; c=relaxed/simple;
	bh=Mktlj+OTxicFnOnRvO/t1kdO19Tg1UkFTI3iySbehWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrDogW60X6SK1B+9iFxYiKoI3B8Ezb5nRZIO/aLmt/DyFsOuQCAWelbY8ERT4nj4OX+OmjWY6uYEZ0EZkYD54abTvgvLaUavkC9KNKanMGlLTQTOyWLL8ZCmyJvB4oJyDVX/CLFIFmQl/ReVChdqehUggvTJMwfwkqPQwAGfd/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ku6wnIYh; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ku6wnIYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781611165;
	bh=8FqnnG2mrZGv3oV4FDE8pFVvXgoRiOnU/HZyHfMy73c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ku6wnIYhZ2g9aYZcd/eM9j+0O88cey/GYQUidhr0mx1KosK9ETR3lxFdYNXqQbbqt
	 swW8guzDcxYlt8DZamdbZy3Sp6ZIDVYj/nyJr+8iOgZi+m22kIlCVFCII+WCKfLLPI
	 /EEHQ+4iKrHlKApaE+wXZbyaA4h000pIZH7ofQlY=
X-QQ-mid: esmtpgz15t1781611160tc5e176d6
X-QQ-Originating-IP: 6Rkg5d92XKhSLBSZ6BknzhKDCzA3VSQXOXAyxWmDktU=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 16 Jun 2026 19:59:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4689365335626012311
EX-QQ-RecipientCnt: 13
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	kees@kernel.org,
	mathias.nyman@linux.intel.com,
	gregkh@linuxfoundation.org,
	harshit.m.mogalapalli@oracle.com,
	daniel.lezcano@oss.qualcomm.com,
	karanja99erick@gmail.com,
	raoxu@uniontech.com,
	cassiogabrielcontato@gmail.com,
	guanyulin@google.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: Free sideband sg_table objects
Date: Tue, 16 Jun 2026 19:59:16 +0800
Message-ID: <90B353283AA150C4+20260616115916.1222915-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M5znx2hx04lbgfdpRutw9wkUcFanOJy+PjalLrgApveDqR3DtoXgZxUm
	WNKW4l+8TPAOn89/+MYhF1wUX3EQ7K10DXks29AJtJeacEYWL0alGoX9dnUerEJbXhhq9Z+
	5KKo5A/gMR9HpDx/mBz+FCypxiu1u0WkZLHBlBJCjRuS4a/Phx2Wbh6ePusCldI9YtxQ1Ah
	j1WND06JJjCfurKvH3Qa7U6g3L07fCTAFaN+QyFdXYJAdMm57sSDHx0GO9GgGfnK7GPOTJX
	m7d1XqI9HTg19bpUqwCJ3ZBADghcBYwn91x+Ex8FJp2ilahS0UFXsYQyloHzoZLWzB06lsO
	Tl6Jq+utZ2vmdiif2S9HpEGEb2Ef0OApENSHZDw1I5KiR2DC0n1WiSRpuYwRjZEPeo0FZVf
	L6vHDRMeS3BwBzuGFQUZvAqkCE3DXzTHvTjzaFxheEVQpJda8C65zmD4dSB9SzNM6rU2A8S
	KjrCI21iJKUnkTDIX9N8xym4r1L0ieSI6QwHtar85+4g4trOjuMMuDNwUFkPXyT7PkasdW2
	xWpcKV0LGdFDkM0RYFi93MPC4c15cGcuQ98l2tt0HWyU+PN1cZ1RVxBrf7HK1dK9EGeShik
	ohGFbI103MwCVSuPjLztxIieZJ7umudgme81IPu+nco9nWeTYc33R8R694C5pzVADpcknmf
	Snz8Wn8ZuvkxL917Ttyws/MJ7j31YXf7isyYs92pMF3dlJi9wiWTu4HF73hW+MasBPGqfYX
	Q9lowYrK6jMmkM+ELF9xvDM+jZxauLzonrv9n6cSlagWMbTpGg3681AiHyafbQFQLJ7X3T+
	BaXVpgDuoZY+y53XBJBAXU22k9Pf1eMaWtvdPOG1aQRvmnrpQWunQjVqrtxcnTmMVjpRvSf
	BQ6A6B4eOPofLdv5g3VqmSUpDPzoW3DV8/vB/7NA/X89PEInq1iTPaISGMXubUpN7v9I6NZ
	beRz9UaXPuOw6kchLzqR46bCMO5z2wekJI78y03aT+rNwUN/0O8HM0yrWv+1OMjDLXzZa4u
	mZeCYgUqUCm/D4Rs2R0ggUiY1a92lNoCrWNtANbZXcsCECeNKk4gvpdhOneDzqxfk4bKAi6
	Q==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The Qualcomm USB audio offload driver obtains an endpoint transfer-ring
table by calling xhci_sideband_get_endpoint_buffer(). This getter passes
the endpoint ring to xhci_ring_to_sgtable(), which allocates the outer
struct sg_table with kzalloc_obj(*sgt). The event-ring path is
equivalent: xhci_sideband_get_event_buffer() also returns the result of
xhci_ring_to_sgtable().

Inside xhci_ring_to_sgtable(), sg_alloc_table_from_pages() separately
allocates the scatterlist storage referenced by sgt->sgl. The returned
object therefore has two allocation layers: the outer struct sg_table
and its internal scatterlist storage.

The Qualcomm caller only invokes sg_free_table(sgt). sg_free_table()
releases the scatterlist storage owned by the table, but it does not
free the separately allocated outer struct sg_table. The local sgt
pointer is then discarded, so every successful endpoint or event-ring
query leaks the outer object.

Call kfree(sgt) after sg_free_table(sgt) in both setup paths, after the
required page and DMA addresses have been copied out.

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 sound/usb/qcom/qc_audio_offload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a0009503b2c5..3658d51143a6 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1157,6 +1157,7 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	tr_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
 	sg_free_table(sgt);
+	kfree(sgt);

 	/* data transfer ring */
 	iova = uaudio_iommu_map_pa(MEM_XFER_RING, dma_coherent, tr_pa,
@@ -1226,6 +1227,7 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	er_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
 	sg_free_table(sgt);
+	kfree(sgt);

 	iova = uaudio_iommu_map_pa(MEM_EVENT_RING, dma_coherent, er_pa,
 				   PAGE_SIZE);
--
2.50.1

