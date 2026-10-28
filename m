Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153192;
	b=M5nNmzcYMh7ulfx1OnfXKKC9rMVY1Ibdt/+CpbbTSR88G12cft6V7NqxqYvcvz4DSwH6
	 eOholiFBCXX5HxkR1v31p77i39e8YIyLQZWfVueD4u+WnkhqKl/wE7tPt6OdSS5pYvnT/
	 GFT5K9mroRXUwylwU38zquDhwjDPIOjwDrwC+3Qo8TrE4uQRy28OZ8LuH3lT8EAembbw9
	 /b8kgoawlUQ//C8q8SGiGG4wuXDIBs7brfaO1DrtgRitUpMRCj1eE4AyLXXi440Oe2e6Y
	 bXhURUOv2kUSHto7BdYIGGTtcLHGI8LTeRxLCstxdfE56CmDrZPbWqWo/K5I0mBAjRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nsGaQIi9dxeQZkRVX41AhkGLuwe1TLVgSWjf4Yus4kA=;
	b=bGcdmENdFfLIZjiVxhaAT9V37QJvykK9EvrwsgRS1sbSc64flPQxrPFH3a+3Pqlh5oVX
	 jowbSVQMlIVXBh6Ctfkvotr5tF0vgXm8p3Y6Ga9iH+TEeUdDAPt8Dfkp+Khw6mfiuxMsN
	 sYfk3Eg9BqOVbZ3wYHh4p0LKiYBRULbOBDyP1x6zEH0sJY0dcDX/UiGdvCSxJkYAv70gW
	 lXd/oL/YPJs+oj26oQ7ydGPr+0Hs2GeiHCjo9yH82oggREtrFnAy3d8pjb/kmEQaZW6cH
	 2Wxo9sGRFkncWukQiiSERDjsP8rD+UMSwV8U7b3cA3um/sL/YdT6oHkW2ZdqnqjP57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zBJY5/Ql";
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB21E606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB21E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBJY5/Ql
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84e513877a3so443594a34.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153190; x=1793757990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nsGaQIi9dxeQZkRVX41AhkGLuwe1TLVgSWjf4Yus4kA=;
        b=zBJY5/QlcEzZMIRgtMRJV41Qyg6UnUhDLPyhYengpjulq9PFJ6vaM9SS7sZVOIFcqB
         Q9roPZv765EfqJoBQUuUJR6OOaDe58GB5Qeq3qTzNwU8QB65Q2BHEBpgVSHf5oEH6sFc
         MxYTkOyWUozPz1fSnyhTgSRhnuJ9cQoMvtqoLhbuuXFsN5GBsUTUi4yGc5cns+G7MaVm
         tjnnK7E/gxawiBhU0TOI9H9JrJmN1FMl1YRyXnWAagcA2bLdym7SEeRFCjkfzc6A1XhQ
         htTE8Kh7/5+ZopI01wwRsbMgsPtolGVTw00B5M8nCJZ8ON2HyN6Sti3Zw9Z8LgqdvsEh
         OndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153190; x=1793757990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nsGaQIi9dxeQZkRVX41AhkGLuwe1TLVgSWjf4Yus4kA=;
        b=NXP3p6WgHOmStu2iMkF/imkOhNyWw2R7vYskphz9K62Bh4YBWHmob1ck1fcmzxwD7n
         NfsfpwNlA0GDYHKCG2mIwzO/RQdCQtzfTNfnHw8alaFQG1U8hne6bYy1y/fCkUQvx3Wy
         VlqtGWPgR9QQ6a51S1Af7m7F1fCs87zItnXW9gGRqJbY3ZK+Qzc3ntRSfQ8PrbRcNEmk
         5/hmtU6N8ZryZq5dmvhxWejjNIiQAxAYZS8IxYw6RHBsxCM7i/1rkT/8icAJmQFOhzYj
         UaRUwkgljvmRQ+OKjVfdDf+uA62oFv/fWVNJB72+1vQnrcC82Oo66JiHJbB15ntNj6jN
         VqHQ==
X-Gm-Message-State: AFq9FYL2g03uwdCw3X9jAchhybx9gggVxZnkUY2GO/lp0eWjF5yBQTG+
	v3sE2EAeeio7hOXO4fTfHi6OTchmywydPWik1iRBoEZ7XaKGyd+QhXcs
X-Gm-Gg: AYBFou0mGNS/t49OUDz+5WYkkJLbVtvR75N0xRM/AuxnJQLJo1c1f5JaORUkUPSQ2cb
	J2mbzNHgnZEuT/99HTiulQgs5keiC8BtUkPiLt4xjJHt6aBQqmXCYMbxlYbcdyyvgTLuuh/8Icp
	g/11JTeQWCKFL/FRUFwPkeVKH6FrbD3bbAxwWrCcxHIkP6T2AREtYj8mZNFaRizR8SBWm1V7cbx
	lwf6cywW1HJ+AJ4nVNk9j2vB5eYcvgzj0v7hhAZ7hHfxN5d1tTbIe71DlqnzDHd5QwF8vDXkSf+
	i+I3XobUJYm0gLdAPkNw1JcuT42NNAPjrncScQ6IXwAXy4YI2YQC5tmjr745YviKzIqW51LRahw
	6Edl1pxdIhvYcm/BmxvNgTAWo8owio4XCC51nlknOgTdyW0nqZYQ0YqNTaVPTvmY6oHbZWkowQY
	2yVVN98GCfEG+jpaZK0+Tv7fUild44OCSmVFwiFDMduTaxzSjuS6HK7MfZywKsx5qkoqrFhCizi
	J90m1ZW7JFNkxe5lHR6loRj3ZN3jbGFfjjjsYVXYz3DnZTOt5JHTLKdhHwgcwnRz/T7cCmdZAsv
	5f6BAXLWBXidAELv5BIMWFG9hsMzhPpWAwzEsIG4S7SpuUWL0AkDWxCghYmXaxTWEMT/PpOQTs8
	jjD38ZyvzaNUWDiYcbAtfdzpKh62SN9IgGPN8jCyGdkg=
X-Received: by 2002:a05:6830:3108:b0:846:6f06:33d9 with SMTP id 46e09a7af769-85943164c66mr3055497a34.31.1793153190613;
        Tue, 27 Oct 2026 19:06:30 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:30 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 8/11] ASoC: amd: acp: add ACP6x SoundWire quirks and machine support
Date: Tue, 27 Oct 2026 22:05:49 -0400
Message-ID: <20261028020552.35278-9-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
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

Teach the generic AMD SoundWire machine driver to handle ACP6x: reuse
the ACP6.3 CPU pin mapping and the amd_ps_sdw_dma/acp_ps_pdm_dma
platform components, and add a DMI quirk for the HP Dragonfly Pro ONE
(board 8A7F) enabling the RT1316 speaker amplifiers and the ACP DMIC.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 20 ++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 1a05d42..97bc5cd 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -135,6 +135,20 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(ASOC_SDW_ACP_DMIC),
 	},
+	{
+		/*
+		 * HP Dragonfly Pro ONE (board 8A7F, AMD Rembrandt / ACP6x):
+		 * two RT1316 SDCA speaker amplifiers exposed as an aggregated
+		 * "Speaker" endpoint on SoundWire link 0, together with the ACP
+		 * PDM DMIC.
+		 */
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A7F"),
+		},
+		.driver_data = (void *)((ASOC_SDW_CODEC_SPKR) | (ASOC_SDW_ACP_DMIC)),
+	},
 	{}
 };
 
@@ -216,6 +230,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		}
 
 		switch (amd_ctx->acp_rev) {
+		case ACP6X_PCI_REV:
+		case ACP6XR_PCI_REV:
 		case ACP63_PCI_REV:
 			ret = get_acp63_cpu_pin_id(ffs(soc_end->link_mask) - 1,
 						   *be_id, &cpu_pin_id, dev);
@@ -329,6 +345,8 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 		return -ENOMEM;
 
 	switch (amd_ctx->acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
@@ -377,6 +395,8 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 		return -ENOMEM;
 
 	switch (amd_ctx->acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 3930cc4..1f9bddd 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -18,6 +18,8 @@
 #define ACP63_SDW_MAX_LINKS		2
 
 #define AMD_SDW_MAX_GROUPS		9
+#define ACP6X_PCI_REV			0x60
+#define ACP6XR_PCI_REV			0x6f
 #define ACP63_PCI_REV			0x63
 #define ACP70_PCI_REV			0x70
 #define ACP71_PCI_REV			0x71
