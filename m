Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF3145A0F
	for <linux-sound@vger.kernel.org>; Sun,  5 Jan 2025 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736119641; cv=none; b=o1kl2lAah6ei1tLmo1p4eH7OR7ouGapimmFAKi1uS9vbnuG00c5gGLDWlk9l2kPP2ud92bXsXceN1mFAhIzI+wNne1Vie6QNjuycZDmeWhSKza0zMf8qoePY0WrmpdycP5S5y9UqDw1LtaLu/pIp6nJt4WhhsuLW+H6+CTZzVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736119641; c=relaxed/simple;
	bh=UvB3aXBjcsW7yrGj4OaqSTMpypigXRjhKEmd+O0/bYE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=rMzL3APZn3kJwEwMhOGxGfZK9RM3isu/SEppYgxKW7e52JlAAVdsWQHIcAB2hs1gJ27ShMNB8SGOiWF0xcHDIy6TAAlPBagK36XltRf3B+MjNZk05T3pXGYj/kWRxQuTMarOex8YvKSLammXG8vem7NLd40+2GsHSdhN5P/iMqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=MkLKG3yx; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="MkLKG3yx"
Received: from [192.168.1.50] ([92.159.77.98])
	by smtp.orange.fr with ESMTPA
	id Ua1StFf2MXLq1Ua1VtyvTk; Mon, 06 Jan 2025 00:27:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1736119629;
	bh=ZKuJPyxn8XZE+xjOI1MXIt3gTe882jKF2cMKS0EBMmY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject;
	b=MkLKG3yxptpSDpNRUS+syowIFTr4z4nWO1DGu8c70EFRjCTYZsGOeM0JYbeKiU1Lq
	 m5bcm88uMnKco6IB23kgszWG0RFLPjwXi2SAO14yvciSbH/V70AGB7w+KayLEh9NQx
	 r9q9JLb5aQr+eK5bJim+mmbsjn06ffBqn4H+7tDT57mAGDT999HbV8IIwecFWUttxl
	 Z/23ekNbX4pC/CY4cvOtDTueUdlG5gs38NCLgXDOalqC0N9AiahsPXTed4m7ckjTqR
	 O27tBJPJXHf+huGRtSUlSB0u5LMMx65IW3xi7BwCyuoBzzqbzwv9BsA8dgTDKuD/ub
	 NMySt0AB5x+lQ==
X-ME-Helo: [192.168.1.50]
X-ME-Auth: bG91aXNvbi5mb3VybW95QG9yYW5nZS5mcg==
X-ME-Date: Mon, 06 Jan 2025 00:27:09 +0100
X-ME-IP: 92.159.77.98
Message-ID: <f6bc0ee6-3c5c-4520-932d-5c040a5ef859@orange.fr>
Date: Mon, 6 Jan 2025 00:27:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: linux-sound@vger.kernel.org
From: Louison Fourmoy <louison.fourmoy@orange.fr>
Subject: [PATCH] Linux Laptop ACP6x microphone "quirk list" addition
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

The following patch aims to enable the use of the built in microphone 
for the Lenovo Ideapad Slim 5 Gen 10 (AMD). Currently the inbuilt 
microphone of the laptop is not usable with a “stock” kernel and kernel 
manipulation is necessary to use it. This patch adds the correct model 
in the list of models under sound/soc/amd/yc/acp6x-mach.c

Signed-off-by: Louison Fourmoy <louison.fourmoy@orange.fr 
<mailto:louison.fourmoy@orange.fr>>

Patch :

--- linux/sound/soc/amd/yc/acp6x-mach.c.orig 2025-01-05 
23:37:36.927778168 +0100
+++ linux/sound/soc/amd/yc/acp6x-mach.c 2025-01-05 23:38:28.066418534 +0100
@@ -304,6 +304,13 @@ static const struct dmi_system_id yc_acp

              DMI_MATCH(DMI_PRODUCT_NAME, “83AS”),
          }
      },
+         {
+             .driver_data = &acp6x_card,
+             .matches = {
+                     DMI_MATCH(DMI_BOARD_VENDOR, “LENOVO”),
+                     DMI_MATCH(DMI_PRODUCT_NAME, “83J3”),
+             }
+         },
      {
.driver_data = &acp6x_card,
.matches = {

