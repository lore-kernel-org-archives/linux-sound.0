Received: from smtp.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84598AD24
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 04:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736139504; cv=none; b=GUBGUSfE0z5h1F63X+An007KhhEYn9XhBInAFay2AWEVbVPXv0sLRnsrLiUHRFJc1a4Wn7o06rUQtS8iEJq/dDIDguqaGXBMLBTKzLvF5U/LC3DsWv2flESgNxpqmyfCCL1ias+4sUH6p+VL7f7NAB6dhiji7SX/M6QIJWHAOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736139504; c=relaxed/simple;
	bh=6DPsIp9lBhnemprGpi0eUco5tfttb9gdZc1SDJIlvJQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=o65oBilDxuX/sa1OdICAqWIP40hRS9A8CefO8TSMy6XJM3N9iC6sdqbkfY/GOM4JnP34/5g6+4mZeX4JodpBpYwTq1h82tx5pTbv8/N7dtjbh2dN70RCTyhtgUBziWIa6IqBT0vjbIU0oMN3NtM1GJ/TQyGy+PL14wlnC/zEaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=Zd+THRQo; arc=none smtp.client-ip=80.12.242.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="Zd+THRQo"
Received: from [192.168.1.50] ([92.159.77.98])
	by smtp.orange.fr with ESMTPA
	id UfAlt5Ve6JiySUfAotH8hh; Mon, 06 Jan 2025 05:57:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1736139427;
	bh=cu5Hg7STF5E8oYGewiexrCQR9JleW601qpXjQ2wVPwU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject;
	b=Zd+THRQoirnTgyLPdmsrD0hI3Hr1hoS2GjLivPSbz3rL8kutUcSACPSAZem6iqae5
	 VChdp/Lmp9OgP8iFJMfMGoW2kOpXmhkdWu35c4+5ziu/Q9IM56kBamSZMp/PcbUtXX
	 sNefEPEH0rnwln7pjLaVa4wRzQp5ngR2QfyrGqEP4ag1zA9co3EPzFB3vhev0lviOv
	 eRAb4Qnq7hV0fmzYZlt9ZcJJnT3ZdVvN3XNVEBr1Kh2H+US+qzBUYt6ueGJa5Kgp9p
	 NK/ZxzPIsmfhKjjQD8sIZRVPw8KS1ihbzYh7YS46dIteuN6fLINEYz9Hf8uWp/WQ1j
	 KEgRHNx8RM4lA==
X-ME-Helo: [192.168.1.50]
X-ME-Auth: bG91aXNvbi5mb3VybW95QG9yYW5nZS5mcg==
X-ME-Date: Mon, 06 Jan 2025 05:57:07 +0100
X-ME-IP: 92.159.77.98
Message-ID: <9c4e1156-2768-4b78-b640-2796581a19ec@orange.fr>
Date: Mon, 6 Jan 2025 05:57:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 mario.limonciello@amd.com, venkataprasad.potturu@amd.com
From: Louison Fourmoy <louison.fourmoy@orange.fr>
Subject: [PATCH] SoC: amd: yc: Add quirk for microphone for Lenovo Ideapad
 83J3xxxxxx
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Quirk entry is needed for microphone to work on new Ideapad Slim 5. Full 
model number is 83J3CTO1WW but 83J3 is what's detected in software.

Signed-off-by: Louison Fourmoy <louison.fourmoy@orange.fr>

--- linux/sound/soc/amd/yc/acp6x-mach.c.orig    2025-01-05 
23:37:36.927778168 +0100
+++ linux/sound/soc/amd/yc/acp6x-mach.c    2025-01-05 23:38:28.066418534 
+0100
@@ -304,6 +304,13 @@ static const struct dmi_system_id yc_acp
              DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
          }
      },
+        {
+            .driver_data = &acp6x_card,
+            .matches = {
+                    DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+                    DMI_MATCH(DMI_PRODUCT_NAME, "83J3"),
+            }
+        },
      {
          .driver_data = &acp6x_card,
          .matches = {

