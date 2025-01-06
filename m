Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68D51DC9BC
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171800; cv=none; b=IHk5dpAegHAFnmqiV2FZTl2X0BG4jLzFP4cfsjaCeFPNoD9ENdW+rUHj8P9apAPmvYsUtSeRbNbVCTfALb13hLOm/CqDSi4+XB/+uzyhx7F1mk5cj6/sB6xSMZ4i754qQc05ZcPbMM7SSIN6ELBf+nZ6RfrkJnuDJAgwcngRLBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171800; c=relaxed/simple;
	bh=FQNIOqhcmBF4a1B4AhRn63eld6T0sRw0nNST4ki7jqQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=aLNo8g7D55/k+cb7UyNU/CqZVc8Iev5EOSJwirQvNQtx6SgejctgAGXwddK46lwsjL0AWZwNWLAixmUEnedMqS3P0mG07lo8jYHhCacqlYsS2EcrPXL4jF2VEO57js3VPtS7GlSQNqugH6+JaPFpzq4fUdQFi7HiUmOP6vs0XBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=YxsEXWm6; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="YxsEXWm6"
Received: from [192.168.255.2] ([92.159.77.98])
	by smtp.orange.fr with ESMTPA
	id Unamtj02vkZ1GUnaptMclf; Mon, 06 Jan 2025 14:56:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1736171791;
	bh=dDxBx+TQ8YgIbVNUyFh1ejFzo8pIvLoAy/zI0YpzMXI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject;
	b=YxsEXWm65tPYxe74SEZmDapMUO18mMrxacu6jKc5O3tr6yMMLd+e8lul6oM+q/H2R
	 Ut5EaK9G+rNbG5hqye05vBGIXzyAvvv7NFK2cm9Z96dc+7B6qMs/N60iBrq3k+nJ9n
	 VcHbuZyiR8thVoWfXWCGt6RBYewyAExtArUrbCW1iNpfJiOfum+S6DZ6Tq+Oic2X8k
	 lQdhrCoT0WvFudr6lkoYn3WCy6NOtZic5sXJrhxvBBXtaUUwv2tXWcSg+nsp16h47t
	 WzIeQQ+LmaxtSARpSiZKdVfwzkvzMLdb/a7bubseGIR8RL0+MHVov5jhgRZphB4wAC
	 3wYfWN0SdztrQ==
X-ME-Helo: [192.168.255.2]
X-ME-Auth: bG91aXNvbi5mb3VybW95QG9yYW5nZS5mcg==
X-ME-Date: Mon, 06 Jan 2025 14:56:31 +0100
X-ME-IP: 92.159.77.98
Message-ID: <d72fc27c-6072-43e0-a504-ed6658986005@orange.fr>
Date: Mon, 6 Jan 2025 14:56:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Louison Fourmoy <louison.fourmoy@orange.fr>
Subject: [PATCH] SoC: amd: yc: Add quirk for microphone for Lenovo Ideapad
 83J3xxxxxx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Quirk entry is needed for microphone to work on new Ideapad Slim 5. Full
model number is 83J3CTO1WW but 83J3 is what's detected in software.

Signed-off-by: Louison Fourmoy<louison.fourmoy@orange.fr>

--- linux/sound/soc/amd/yc/acp6x-mach.c.orig	2025-01-06 14:14:46.099123617 +0100
+++ linux/sound/soc/amd/yc/acp6x-mach.c	2025-01-06 14:14:46.099123617 +0100
@@ -304,6 +304,13 @@ static const struct dmi_system_id yc_acp
  			DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
  		}
  	},
+ 		{
+ 			.driver_data = &acp6x_card,
+ 			.matches = {
+ 					DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+ 					DMI_MATCH(DMI_PRODUCT_NAME, "83J3"),
+ 			}
+		},
  	{
  		.driver_data = &acp6x_card,
  		.matches = {

