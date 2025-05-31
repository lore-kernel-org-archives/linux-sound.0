Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFD86323
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748710520; cv=none; b=s4277dY8y9DeH30hJF7KBstFWq9lPMbLyZYtccdD7GJgZqcQ+RLDC794fxN8OWvpl60GK9crt1RNFTMPw7MeFL/yVARSczr7eYmrW5S5mN7QosA3V+2wh6wP+3RLeoPd9ZBBA8IkKls6mNwxNmcnRX4RkEkAoG0WmZ+wIBvZNTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748710520; c=relaxed/simple;
	bh=WuO9HOBJ/L34MXcbqyg/3F290qm6t5y40ASjF0YTDMg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fL6Tm7Izv1L8xIc6YbltfK4RbNCGpAHqK7Ndo6sp9Bwc34akoUAF5chw0OKb4HLVGl0HZ2pcDUzFGvsEoC7TX1fcXeWqaafoKTja9nhJEHy3/lRCjnTpqJx/inA74dyMVx6t5QD3xdtZNnnwk7X50HuuUCRwWjPvHWs0XFqv5nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=TfqCHD6J; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="TfqCHD6J"
Received: from [IPV6:2a01:cb0c:fa5:ac00:9d01:8dd5:f3cd:13b9]
 ([IPv6:2a01:cb0c:fa5:ac00:9d01:8dd5:f3cd:13b9])
	by smtp.orange.fr with ESMTPA
	id LPUBuEwLr1n9nLPUBuuZah; Sat, 31 May 2025 18:55:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1748710508;
	bh=tfVBt+0A8QdJ3hOUlFmWAadZY3o9qdfcnNax7ar9y2Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject;
	b=TfqCHD6JF+0YC2A4itjgeZNApSjQlq5u4Dwqf636Gp/y/mWYyCnzWpddlvrXpmuP4
	 eDFtm2tJ2Zgwe59tWuHyrqYm+1QMdAzlfyqIRugAH2l9p8n3Df8kz8d2pDWAhyXB1N
	 oRWVhgS+/hrgR1w+lifpMQr+DhJTu889pf7vjYYPijxoL59T2KonZ7KpnxfTQNGS++
	 81wiodnfIdChSCKc/1rhvkVrLftMXrbuQvOXq6UQpAN5zS//XntuGYp7F3OcV+7YjO
	 jaV8OE9lwDmKU0SbzMwYPCVCpotXnpCUbX4sW5aO1oFOKqpimiuxe6MZwLtcg+SYrn
	 P1KqjeDPj+bNg==
X-ME-Helo: [IPV6:2a01:cb0c:fa5:ac00:9d01:8dd5:f3cd:13b9]
X-ME-Auth: bG91aXNvbi5mb3VybW95QG9yYW5nZS5mcg==
X-ME-Date: Sat, 31 May 2025 18:55:08 +0200
X-ME-IP: 2a01:cb0c:fa5:ac00:9d01:8dd5:f3cd:13b9
Message-ID: <6249498e-7986-4083-8909-2a50ba1161a6@orange.fr>
Date: Sat, 31 May 2025 18:55:07 +0200
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
Cc: linux-sound@vger.kernel.org
From: Louison Fourmoy <louison.fourmoy@orange.fr>
Subject: [PATCH] sound: soc: amd: yc: Add Ideapad Slim 5 Gen 10 to Yellowcarp
 acp quirk table
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Adds the Lenovo "83J3" dmi code to the YC quirk table to make microphone work

Signed-off-by: louisonfourmoy <louison.fourmoy@orange.fr>

--- linux/sound/soc/amd/yc/acp6x-mach.c
+++ linux/sound/soc/amd/yc/acp6x-mach.c
@@ -353,6 +353,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
  			DMI_MATCH(DMI_PRODUCT_NAME, "83J2"),
  		}
  	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83J3"),
+		}
+	},
  	{
  		.driver_data = &acp6x_card,
  		.matches = {

