Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04333D994;
	Mon,  5 Jan 2026 03:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.203.221.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767582139; cv=none; b=jxnWdpRQYN/+bl1/WDldpYJ0v4d9Y9PLfS4CNkD2sqHX7KGLzVk4iDvjvgpEdQv1tAjMPVhMZUDJAMVl42as3CZ/tfxKcr3rZaPTmHDSkbdKcaTR3nXelFA1CMXe3KJi2RScjJeQjk7IgsiMSgN/8EL4HPYqmPEz6BXkEkZnIz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767582139; c=relaxed/simple;
	bh=BFEjwR2Arkbv0ipELyTdtC+knjx5XiRnABAIKHUy6C0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G7Eami79yAfI1+6b1zQQYBMS2lro+C15r4heMtGtwY4tGBhbfkCEyON5TQ8YuRF5M4IcDabZxM6k3mOMEtWhd6I2FXLqVzeVCTWT92GTXjBBP/1ECZeAGxARsTsJmsPhwMFRSJbzXIGvcUqM1V4I6oLvG4qZpNMyCzIDC0+rwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=ELacIILX; arc=none smtp.client-ip=159.203.221.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="ELacIILX"
Received: from localhost (localhost [127.0.0.1])
	by comms.puri.sm (Postfix) with ESMTP id 0A77BE27B3;
	Sun,  4 Jan 2026 18:52:39 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXD9Zpc1XPQR; Sun,  4 Jan 2026 18:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
	t=1767581558; bh=BFEjwR2Arkbv0ipELyTdtC+knjx5XiRnABAIKHUy6C0=;
	h=From:Subject:Date:To:Cc:From;
	b=ELacIILXTT9Fqj4bwvg5jSmhJ4px7fU7TirmSCuQtkW3NOXSzKukGS8T8L0xvH7HL
	 T9cGxi97VwJrPotXcmUx+2cP2IqW4G7SV80YmwwMvXI5jqWDRCUkCog3HeyD+FH9WI
	 RTbF1jRSWpmThtulLEjk/+Tn7dR+pFHN7yvfaofJakJGCfGG2oDmMQawtVf3N3e0Ko
	 KWunDbxRbatZOa/wmhKMnU7FXEsnsJ4l6/xlqcEOb0own4zSyYq25tBAqPPpzeIYag
	 +z8GUe6XGCcFd+BRNR30UWAlqQiToD17DGvr/ydDnti3/zcZfTFz1Kk4FSLSELGGNm
	 UdZZLuJXVIRKA==
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Subject: [PATCH 0/4] sound: codecs: wm8962: Assorted fixes
Date: Mon, 05 Jan 2026 03:51:53 +0100
Message-Id: <20260105-wm8962-l5-fixes-v1-0-8e047171da2d@puri.sm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEknW2kC/x3MywrCQAyF4VcpWRucDnZsfZXiYi7RBtpREm9Q+
 u5Glx+H/6ygJEwKp2YFoRcr36qh3TWQp1ivhFzM4J0PrnUdvpd+CB7nDi/8IcU+F3KHgVI4FrD
 qLvQfLBrP5hSVMEmsefr9zFyful+iPkhg277IHjcigAAAAA==
X-Change-ID: 20260105-wm8962-l5-fixes-8cde049eb67d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=BFEjwR2Arkbv0ipELyTdtC+knjx5XiRnABAIKHUy6C0=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpWyd0q+ONKJ7R8ocECK2YvcfsxvptHhiTi9KGx
 eygy53gqYyJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVsndAAKCRDo8jXPO9vD
 /8cYD/9L5ncvzf11mghMvE5tjuEhYQYyhRedXAMHAOU1YsYpYvOt2WyyoGy5qvzUDQD0+n85yaB
 M1McjPQkgYeAYhvDhHdAtHfrWI2H33YliKPA+FCurh69aqaOQiEtB9vitSSx4Rjnx7wrQieRVGl
 yqJaTD2/+pxcgnHHM0IHkFiBEPHdHcmV/WMtNiP8iliK7kgvOmUxZqFv+7qnndDUgL2mVIYtF1y
 3Di8yjLwh2BCcPTxs5Qo8nZ1MF1wKW3J4n5fsj8PbP5HzJF433EquLmJfTW9cKAxCYfAIBieYlw
 AvcifeMjoAWdeha3vilfdoCBzPPvFBLEUcbhq0ZhkYTI8t85PW4PouWfD0OIernqCAVz1bO62ns
 EO2wmzNuuk47UI5QrwJFSfi+27n+7Tb799xceeH82cBcm7KjA0VPLCJzRBuh169ntmq4dS1KJpJ
 yNwcUebU+sA8uxzmZprVDkIHxcFf0xkf9YFKPzjUWBFLicoX6bN4CmU/k0Y5gwCEq9OUSpmaFWn
 nHddPbgp1m/0hb7auH2+aRXUbfxb/7iodaFihwuvd32mN8vC9MVaWQQ+bOBnncV3jZNAgx3y45l
 XgFUYFGkrm5kj/umhSTFMGLrQNe+euizt67Pn3eo794IVSTNVbXCleY70k8pQVOpLnZvEzx6LBU
 ca2bYdwqhOLdNng==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

Bunch of patches developed while working on Purism's Librem 5 phone.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Sebastian Krzyszkowiak (4):
      ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients" mask
      ASoC: wm8962: Don't disable SYSCLK if it's enabled via DAPM
      ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug
      ASoC: wm8962: Don't mark WM8962_ADDITIONAL_CONTROL_4 as volatile

 sound/soc/codecs/wm8962.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260105-wm8962-l5-fixes-8cde049eb67d

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

