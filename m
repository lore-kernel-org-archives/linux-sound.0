Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319180;
	b=X7+GPIp8S01q+6yZH+HYoyJJNSk9yILHActfnoi+Ch864YIlRMqYeQcNCazP1+RLhEfc
	 VsavbwAM63AcckO2EwSHH9TsGLlXQl9T9GjkcOa34L0f1eQ7OcEHV4VNVBTrUBw4CYuIt
	 MNIGA+Tv46+5BcMKpQgXcSMMDrvxwkgck83DpEDPi4tWYTYcUG9n0U0mO8oZnACcTWG0H
	 2ubyJOEcHo30iQYXM2tthy7bpYbEbJ6NTg+/JDVjiVck5/3PPBpTfh0BX04tm4EWlR1/d
	 zzomHJJoAYBMT/OVXej2WjYwr3Ev3aoRQw0C1uC3BWuxygDTyVlV9RSDZIhgfActoUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tKtEUH8k14ZbmYMDfgDEWIX6ItrlOwSkxivJg5GmxYo=;
	b=sHHmBpfLYdfyLc8VMJqnp6WldJj517Bc71aOBME9DIJwdnSdgOL5ei56NDmyqc7AAkl0
	 dK6eXClG2J4xPKuT1v4u1WJanw0/tYAgvEoUisW/gSLLMwdk2RPo+pR6lp107wjcihKMu
	 0cmqN9rkEkoFiWOzGHeDk5pDThEhAD8g4oNRB4YM/vvYPjJd2MxLSNaoi1lx7Tbt5cIyW
	 mihITzKdWgTcvShBPRGuVm+3N79tZmmsxXBN1kBcvHDuG6DoOLORsjmICdmZhXDMSyQyK
	 05vVXcz/GK2XpXyCIjy7BraBbVgpX23fbM4NcWBtiUFy6H22H0gRgAaXvbXXgmCpa+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetheinter.net;
	spf=none smtp.mailfrom=wetheinter.net;
	dkim=pass header.d=wetheinter-net.20260707.gappssmtp.com header.i=@wetheinter-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Oi1kMpoQ;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E1606A32C
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 03:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetheinter.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wetheinter.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetheinter-net.20260707.gappssmtp.com header.i=@wetheinter-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Oi1kMpoQ
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-92125687442so20773536d6.2
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetheinter-net.20260707.gappssmtp.com; s=20260707; t=1795319178; x=1795923978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKtEUH8k14ZbmYMDfgDEWIX6ItrlOwSkxivJg5GmxYo=;
        b=Oi1kMpoQ1fEf6PMpij60BbNJtcae2xpeK0Y2SraIk5XdkD6f8i6HATxDlZc/8xGo46
         4zh/oS+FnY8x608nNazHghj7Cv2j3nJZEYstgiP3Qf9f/vg3Rm9k3Dw5MBpDwq9mZND/
         6LBd3RPMfSsNS0ZJl/vVI5idy8YMQ9fjO/Tgaz/YDRBi2JoFTS9PsbsRZW5YBipTC7zh
         JQ4dIzvGTSHG3VZPjIhUT2rM4+aeXOGbzNVa0l/YDZMg0FOuQWi221TLYGo+Cnz5VtIG
         xVDXlZ8v98ZCIcTi17sam0d6m6CJ6kO4K2qcHrKSQTN0eAW6mBSBFqPUEB6crP1r46Ph
         /KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319178; x=1795923978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKtEUH8k14ZbmYMDfgDEWIX6ItrlOwSkxivJg5GmxYo=;
        b=AuIdd+eTjsC/VOuVu9e2dGa1uSnE2uLvExXVkCyN4qzDn9a4fdBHZNS1hH73oGrXUW
         QB7A368kgxSyqJqo46jxtssSshGDi8ZLkeEyxYg96pOv84NVPZzR75K722b49cH43D++
         1EAEVZTb8rcKny3zuMKLeeL+Zl4pqmGvYhTRYxLgYjJJxuyY7oqLkFQtUvO+PQxQhmSK
         zO4KMJOpEq9EyJoABmBVSvxoo7wLkLHZXQ0YmuB0pU5SbnY05+4awoLj5UJ/t1aybhDv
         pR61mgaQe1ac1J4GUdweNtKz5NgibqgKPARQrz/70rr3Lfy8Gez8a23ADd8V+1uySALf
         5+GA==
X-Forwarded-Encrypted: i=1; AL+hErG2GGXvxMTpn576m0Qn+bhQXGRJJctCdccenlDVxp9XAN0WdfbJod14AVoRMlSCWshjf4Koi4A2l4tNMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HGNN2PWWQuTe2hXCKrewcLYEpB5JlAun7Rf74luiQ1+2NTfgT
	dOF5MKMBaaf5AsrwHQ9SlF6i2gMXcUxj0+seVghXdho1kqjJY8htAnTfmRA3sK1o1nE=
X-Gm-Gg: AZFdTZdX8phJZbgGabN6bc8/3nOpUoYbcxMEOwXzV+UW4Doo73c90ra4lre8NW5+qem
	UilHGvjDxgZJRaaX5TegkKGZqbNfkEh1NdhYM1pvVoiTSTkvjsdU+Xcyd0JFMLNQWFIemmeyyX2
	Cep6K1v7HNnW0kUiz+HouiJ/gxknYRhCEZmXdXH7zW4RDkG3g+iY0HB66Zmc82g2Lyp+IzVx5Do
	s6dyHheVx6YW9IG9p/w+SAqI7ZOzjYa00MOMKkcgHTPDnuWpOuz1o8fQl7488Yvv9ixS+9Oby2d
	5Jtgo9UxuuzwPwnJSNKTcj65IPWecP+bIgnc7LBrbbG5vYgtvsUot8w6k1Ke0jVDUhqxbr/L3dY
	XBSeTgjoDaB7uE56Jyu4cyE8RMscWV04Gu+cShKmPinxvhUHv6KKnZDIzSvyvz3WgJdX8nYm81D
	PP6EdQbrMpphbs2xuwxhi2i/RYXtK/RzvZMCkGsSzSs/ZWl9lxqgVosrd7K5+uS8hEOH2B2V+xt
	I5ctKGw53HpNTujtGFozoTdbIxRAI4eFDt/GYqedVuov84kcq/dk3TNVTQ0c4vJ97OmbLAOgd5y
	lkIcWnw8s99E+SIb1/dG6xIty7zRz+OaRWOCawWCDxDqce7mbWkeqr9m+wf6weB7ryp9Y9Gf91J
	YZW2laLUATY6yC+XgVr0Qrz/s7lBJArWb6PcPS3QJo+CvmgIFmM8hCEwzDy3fsLLJECbPVl9pRr
	jY8wDe
X-Received: by 2002:a05:6214:20aa:b0:91f:3c0c:50a6 with SMTP id 6a1803df08f44-9213497c813mr142116756d6.6.1795319178500;
        Sat, 21 Nov 2026 19:46:18 -0800 (PST)
Received: from jxn-msi (67-225-49-153.sktn.static.sasknet.sk.ca. [67.225.49.153])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm68210376d6.34.2026.11.21.19.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:46:18 -0800 (PST)
From: "James X. Nelson" <james@wetheinter.net>
X-Google-Original-From: "James X. Nelson" <James@WeTheInter.net>
To: Vijendar.Mukunda@amd.com,
	broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Enable DMIC on MSI Crosshair A18 HX A8WGKG
Date: Sat, 21 Nov 2026 21:46:11 -0600
Message-ID: <20261122034611.26008-1-James@WeTheInter.net>
X-Mailer: git-send-email 2.53.0
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

On the MSI Crosshair A18 HX A8WGKG (MS-184L), the ACP6x PCI
function binds and the DMIC platform devices are created, but the
machine driver does not register the capture card through the
firmware detection path.

Add an exact DMI match so the existing ACP6x machine driver exposes
the internal microphone on this model, without affecting other MSI
models.

Tested on an A8WGKG, board MS-184L, BIOS E184LAMS.10B with Ubuntu OEM
7.3.0-1004-oem. The patched module logged "Enabling ACP DMIC support
via DMI", and ALSA enumerated the DMIC capture device. After
WirePlumber reprobed the audio card, speech from the built-in
microphone was captured in Google Meet.

ChatGPT/Codex helped diagnose the driver binding failure and draft
the quirk and this changelog. The submitter performed the live
microphone test.

Link: https://bugs.launchpad.net/bugs/2175499
Signed-off-by: James X. Nelson <James@WeTheInter.net>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1be8504..bfe69ca 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -556,6 +556,14 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Crosshair A16 HX D7WFKG"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-184L"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Crosshair A18 HX A8WGKG"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.53.0

