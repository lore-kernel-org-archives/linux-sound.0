Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5F5285CAA
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112420; cv=none; b=CVusWGglp3KjirLweu+m/Wdtttb1V0Fo7kTAgwwj9caJv8so9OlHVJyhhokEqfcctm5jS+YeSq4IpY7P+vWlm/KM+gq+J5lTACjufmI/cIEAypyE3NSZPkHk6Ksv1f2ATxcMvZJ3twib+T6TJvlI3SIY8EphGOcqH/F0k/pjNbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112420; c=relaxed/simple;
	bh=xo1poeIZSXWhFu8Z59FlKesikj7/JBi6ReIj+nJGSKk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=e5pQERvMDXiqi3SYxfuMjwqxm4uzXc6TxMcQZ++KLfEbwg6mkKdizkZIHJF3oq/IAw4ZK3oUbCEOMgat11Fi/naqbSw4Afh56J9GVxi7L9flFidtMNBxu3pjakxsj6JLrB0bdOndXXu+ggT6/TSN9VyKGC3s5Qh2LODn/feFo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nXu0l8ir; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nXu0l8ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786112386; bh=51KrcFiptP6M9Wn+JdOtCz/dSpKZuroZWGIkhaxsIfU=;
	h=From:To:Cc:Subject:Date;
	b=nXu0l8irbnJ+S7fyPmvfTq5GqG/G9sZ2OD6EOCDAR33H76g3eF81iFYQptLjIi27b
	 FkR6EVJQ4rhp6aycsYKOpmafRxMy9JygcXQCJ1KbnzXv5cxctmUAarHgdjmzlz7f3e
	 nRnFvuBxDhtyn6e5K6QqHOgZrdo1TLqzUMqyFuT4=
Received: from xein-hyper ([2409:8a34:4ca0:240c:7a9d:f2ca:5878:ef73])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 4EB9D6D5; Fri, 07 Aug 2026 22:19:43 +0800
X-QQ-mid: xmsmtpt1786112383t22kjoe52
Message-ID: <tencent_428392223C2AD3BF23E7ABAA7521FE5C0C07@qq.com>
X-QQ-XMAILINFO: OYTBn1rNHH7tqoFZ9pKTlSFZeI3n6XXSYvZATJGHJSc5jijF62KbdVNYhk5Vgg
	 1NPIjdzLXpM7redqpEO3pvtd9qV3x5XoXHnkQH0zVdZqyJ8ZLAC5l7tb+5J1HWomj9VfnOPdLava
	 5FRW5kf1GHvWIJxr/XeVbGTbnlar5oTnHJW/8dSQQX1iFFAIYHGvvawIQ+NHhJuJ4Ddd3rXL/P6+
	 mB12z1T1Dw+LiEYEGNlRK/g6d+dUmHW+hIN1MBCjBA1Nbqrzqt8MohJD0Il16Omp8LtrrDKSCthP
	 EXIzOl9A+QNOnP2LQC7ysnV17RvkzZZl2C9RFGbW4Odp6W71FTRXXya+OF1/VkI48/49jTMoFfqH
	 ZT6FqkoMP6bHi9fbBdNQkG9o3wDKmkeW1kG+UTBnkJcJJI7A0JthFlP4Z6G4hjU6mt3kEG4/K46y
	 GoO117tUALFPfBdg2EPfcsmGpfpEiC334HwKl5b7foNVJb/cjIknmONrTpWqd29jkoc5QjyHgQTe
	 plf/l4MQrwTdqe2IliDp0gTaFn33adr7k39ufHs/l2GBXJ3XF+DzEf+M7PhCfiUt4u62ouUAS+Hf
	 sRtlNkyfVbk9aCOg99cfHrx9cxNeM0nygZCSO5na33mivxhUO3CiVPoeYHsW9Lo9bg93vUngZQgN
	 wsIYeHiCUVIaaod3KD3v9mFgzDXJOmxgvUKAZQ4LwLJMClUglnhx7N8uMpbQH7BqfEI3bbMMJkp9
	 u52LgS994gnIL1+FyX+bh9mvh0hElbARK+folwYBg70JYC3GKfDkNbdQ0/4xFeLe1wrooMInX+Z+
	 f90uTuMMkTRIDn8nWrxzSbUTHGMA5ZkwLbl7vPjkoAoSA7yvbLVtmhljZBGUH94BSi3Mk2mHJuwD
	 84o1eKAKBso1zKhQpKe45/YO/5qfiOs99o/DssS4nfB9+GcxiR577EEmSxect1T4CrFGPZetlx7K
	 J12btww+KkahmVo8SSRHds4D9mtgxwM3JL5F8+N+LXEIyohVaB+compWRXhk3M6EWatRvUWJRtnN
	 wCshwXQs7cOALJTRl6AGGzT2aDgQMss9FNWrfEY8vCuXANhLMkwCutVGXBC1qOSdKf6MHNucqNgX
	 yg4TqEVJsvc8/WbchbgarMksV8A3AQeVVNGYulwX95gWZ6zWXNTSkfzTse3Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Lin Xianglin <1021538027@qq.com>
To: alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	broonie@kernel.org,
	Lin Xianglin <1021538027@qq.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming Laptop 16-ap1xxx
Date: Fri,  7 Aug 2026 22:19:43 +0800
X-OQ-MSGID: <20260807141943.9059-1-1021538027@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HyperX OMEN Gaming Laptop 16-ap1xxx (HP board 8F06) has an
internal digital microphone array attached to the AMD ACP PDM
controller, but the acp6x machine driver does not register the DMIC
sound card because this board is missing from the DMI quirk table,
leaving the internal microphone unusable.

Add a DMI quirk entry for the HP board "8F06" so the acp6x DMIC
capture card gets registered.

Signed-off-by: Lin Xianglin <1021538027@qq.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index de5c895..ae86d3a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -724,6 +724,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8E35"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8F06"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.55.0

