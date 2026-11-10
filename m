Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315319;
	b=5AZug29mQSyNU4/q3jtMNt1nwjSjGmFe6VXkTOAWng6ZCbtZd5M4k9s8SHnVp1Kxqde3
	 MV6OdWf6SNuYpaaQJfnNhyTh8EjVk7jC8M4sOfrh/9q86Z6CsFPUYTApwFdD8jIcSpMVX
	 t/d1ZIO0qqgDlTy6H1oE3IRNKe2aSHUyAp4luGfq9GJO0aEYXGLha3oQ0snk4gdOc4Vd/
	 iC9oV3EcwzoYWcKk+7otj6PyFiRBa8/AL3kMufcSOA/zvShKLDWbCaUxYi8qy8VUU4bS9
	 DLoaKZdgpQywcHM9qAKEfvtbJU8RUmnDM20bv6fMC1Ruqq18Uq+GLn/G5uxpaho4VeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SRPDILoa9QXxM78JgQUbKtTabkG23wBYdCzn1zTCpo0=;
	b=lf+1umsyQ5aHdpsnLBLz7rsYNH4zlhFdbFjr7itapRzFR/v1xIEWVfDjR9ljOrJ6uG8F
	 SmbiEAwwjc2enqFrcMjyfPMAx/eKBhQqzyMCZ/zF1MdpnFrxTFrmFPFz01Vj1x2jAvx90
	 lx3qeVOKPusg/0irwlBKTOJebe/YLdA2mfz/5YxRZbG4awHCAoYgctsi9T4GmhYwosMyd
	 NL9ns/bwO5PKCcZpl9mvYDftKW8cJ9mhdKljlp3QiQktH0JjNwWxz4uUdEnR9vCLR59L+
	 FVudP1YEk3VzuaUN7G2D9Cw5htny6i9Ua+iXXx8biVWLnmRlM6w0C6NzScdQr0em4Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jAWp7xK2;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC8460A2626
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 12:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC8460A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jAWp7xK2
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2789336eec.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 04:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315318; x=1794920118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRPDILoa9QXxM78JgQUbKtTabkG23wBYdCzn1zTCpo0=;
        b=jAWp7xK2Cccs+Chg/AP2WRTiZgrU2U9WpPLfGVk+SiwzUjv9OEZKNtrHy//Xm1UwiB
         8kI+60xGSsNHQn/6Ky2/smI9UuvtmLYF3QD6BEjQeEGPN7cK+7FFSU/o56b01kj2xW7Z
         vyejLFvQkl3eSYvxEJJKJGAxxmbZAOAQXgU7nizluEtzVGtbaIojT0d4pJs0xIv5rICo
         ay2NrSDRIfxLzRN6Z85v418etSCHq9xC/RVp1xtLBu+Wq77s5FtwKjc/j4yInsacpxMo
         btr9UpThkecQb6xnzl+VUlgJQ8I7tUnXVvLwLLmVcUgNstDVO1AFluIVJlZ3J9fQjfrJ
         0D0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315318; x=1794920118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRPDILoa9QXxM78JgQUbKtTabkG23wBYdCzn1zTCpo0=;
        b=s/kidgqDzyOlr5noVMjjZbE+MlKGjLwNxkR3FAVluOXkPzGqd/Rppy2zUY61h/oZW7
         VBlKDmNgNqV9mBKMTXeRL1wQO8wf6EY1Q/WUerCjxoHncLJKZEnwHVn8H5MpoXGgd3CT
         BprT1rznUxLevoD60HOVHEJL3ELlx/hRslpyt10Zanlk5MHbcXCfquhwcUGuKDwSLWUc
         fUXwSN53Jc+71x3dSTLhkLHmzJ4pPEKGphoqxMHQJdkOwbaT5TzmUEpAtXoTEWQ6t6mK
         lOASMpAebYMHetkMIGabdy+HlWQUabLz/7/j926DzL6YigULgI1K6PCIqCtKCP3nOJk0
         3BQw==
X-Gm-Message-State: APuU4Z+i+6TmapDKlo4/mBekP22olfVYoDvFRnznvIHBLFwaz8685oIz
	V2h/r0uGE+YOlxz9wODMuMisEHBhRRYODp34SRDJ+zPbBHwohZ0p0a+unLa8bUSxTH4=
X-Gm-Gg: AYBFou1F13wlHWnaAYI6FOxHebHQ7ynxBXBuj2M1277R7dtQYps+Rm8Xv6uGGJ0NVSX
	2y0wrG28YyrVlzkr2jpSGIXNva7o9uJ3/ERQJF/lvgIrjJEca1zlDbcVSp27OafA+L/tfALlVNg
	DAKVMm73y9YFEW/pTDEARtS2xZt1nEtUNExwRLb6thL27nMxVjkCeaWitVreU4i8bpdUUIlIDgB
	+Svo4Ccg21ZicWF+c4H4EXlBmCTtEksCXBlR5ysHzhP6Lki1XqQ6+n5j/z49y8UBR2RxOHB6OeR
	QszlPxsoIK96ncvx4mmKLjjOs57k9XBPPgYbRLUDk2ZL4GMntC8xjFARsVbkCGwWAjNcC1CAbAY
	/t+IjEo5UKHXRHJj8p1cO6QZlZWeQ2FKUQRTsEJkxzE/7Qd59AXylBhsrSSBL8BiYnRORGB0608
	bFQEa8+IQMH1tBwCQ42QPLXBRVwESfXI3hpXUzoE6UIEqW5oB8rlJHCgxWyKuRWKf7UtnAjZqp6
	t5rXW+dfyXVIknuH72T5gXkWDWjmRBH9e/itxmGbBmihU28tloVBYbq7yjovOxGYJ1jgv713q/t
	qTu0JiQtnsZBZ9zwmxwoc5IIUrLLr+1PClfO6WUKPCkpBQ==
X-Received: by 2002:a05:7301:da16:b0:36a:79e7:2fd with SMTP id 5a478bee46e88-3752011c1f8mr3378032eec.40.1794315317645;
        Tue, 10 Nov 2026 04:55:17 -0800 (PST)
Received: from myarch ([121.165.40.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae63a6sm6855380eec.1.2026.11.10.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:55:17 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Kim <jaehoon1744@dankook.ac.kr>,
	"Claude Fable 5.2" <noreply@anthropic.com>
Subject: [PATCH RFC 1/2] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
Date: Tue, 10 Nov 2026 21:54:28 +0900
Message-ID: <20261110125459.3924-2-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110125459.3924-1-jaehoon1744@gmail.com>
References: <20261110125459.3924-1-jaehoon1744@gmail.com>
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

From: Jaehoon Kim <jaehoon1744@dankook.ac.kr>

The LG gram 16 (16Z95U, AMD Ryzen AI 400 series, ACP rev 0x72) BIOS
sets "acp-audio-config-flag" to 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC), but
the machine has no ACP PDM microphone. All audio endpoints are
SoundWire peripherals declared under the ACP SoundWire controller:

  link 0: RT713 (UAJ + SmartMic functions), _ADR 0x000030025D071301
  link 1: RT1320 (SmartAmp function),      _ADR 0x000131025D132001

With the flag honoured, snd_pci_ps bails out with -ENODEV, the legacy
snd_acp_pci driver binds instead and fails with:

  platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found

so no sound card is created at all.

Add the machine to acp70_acpi_flag_override_table so that the
SoundWire path is used.

Tested on LG gram 16Z95U-GS59K (PCI SSID 1854:056c): after this change
snd_pci_ps binds and both peripherals enumerate
(sdw:0:0:025d:0713:01, sdw:0:1:025d:1320:01).

Signed-off-by: Jaehoon Kim  <jaehoon1744@dankook.ac.kr>
Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>

---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 8e15638..8dd5fb4 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -63,6 +63,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook 18 M1807GA"),
 		},
 	},
+	{
+		/* LG gram 16 16Z95U (ACP 7.2): RT713 on link 0, RT1320 on link 1 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
+		},
+	},
 	{}
 };
 
-- 
2.43.0

