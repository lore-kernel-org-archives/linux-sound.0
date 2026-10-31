Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442111;
	b=QemBdXF0Np1mQAix8hQTfDfbZwcpqENeNc6/0YvDNE+5xm040w66cmvgGMkLGuekC+0t
	 nbboL1uS3GeuUZxLanjQGtRLNNZGS+KxboRfGiZmtmdi0z7JcNRDfTV9ILSKfZgjTOBTJ
	 YmD/1ZYuNsCvtRA/tdsoKb+u7rBfSgyLz1cPdWpRyJr8z4iJe2/mHUpOvtnC2KZPucW6E
	 j83vjNLQ2lfkZyOX6DdcEA9lPaFz8ARWmdb6Rop+GPPDkEXtG1lV6N8YuibtRSCfozRv/
	 WB3nfW5NaszXuketq5h6Mtgz6pugr+rhsRznDdNpTG+5BXTMZ+aca0tsV6vafhguc9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H2n5rvEmZawleJvXW2iwJ/2FM80C7pwmFa2gEkkaLOQ=;
	b=Ak0x172g8rGXYYLFDE1EF9NS9uuRnKhGOo6jAXdVImzxHkWgC3KrLSp+MWaUkatptbHU
	 ZMrCVCx+ogAStuv+VbdDmz6Ypkod4VNeW1VWTqLmpENMZBjtoo8wqSrNG09xeJkLWbGwm
	 AJHjOnqU1cHnuVhTgbmnensDqB4e+EU88UK1OnzMV6MgUljUU9N70b15+a1MoExnwxO5Z
	 4t6PY/teU3gDUxANn5VMo4qoWXabEvohcQ+aHtYsz3wvj/l+SqkBzvQCtGdN5eUcxDCKr
	 eoPaLjDl2BylS44DArpNYOSoiTdXcCrOoD+Lgr8ZX1PaMiL+Gtor9eDChtAnS3Jd8GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHCOAozE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8268606A31C
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 10:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8268606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHCOAozE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so13958005e9.1
        for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442109; x=1794046909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2n5rvEmZawleJvXW2iwJ/2FM80C7pwmFa2gEkkaLOQ=;
        b=aHCOAozEayO/tn/0TW0arhTa5D7UGVboOJkhGa0sRb3GIpYYiHFVGlKSaWSg+LkZRG
         whKqQ+BmwPd0Rz86HU6PuFwNvPDFBcIU/c7aVNVmokCaDm00RZokt6NNSyJz/12Qi04U
         08r7r3yZs+gsu8z0/AOOy1vO2ViZXsrbw54hHCKBtjBeka+XAeYTJ49NYM0CU2maykdJ
         Kexc+WL0XAVfVKtuB+5NB17l1gD191egPnSa1AHzCwU38IOJCMtoSu7Ywp1EkgfJXeHW
         iecdqubAs/ghMtah/Z7BffR5N6ZK1XHTlou19m+xDzqg8ZTCkCd2anWqycIGhQqHq73M
         edXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442109; x=1794046909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2n5rvEmZawleJvXW2iwJ/2FM80C7pwmFa2gEkkaLOQ=;
        b=hIVRuTu45Oe5NvIrB3rhXLylFr302oATZxl5F1Wgre9kF7J5S9fAxrNnX2qdIdL1sz
         XEL0OX9WaQuo0Ssp7H74fLlLIlhmfLGf8w3XhSSNZuDGYvSmkrVc+PXeK785xwVQtuXG
         05mprIkaD89WIlHrg9rOIcfRjTf4iENMi3umJiIMmKxzRirOvA7vnGk/yBEiZaQ2+pdX
         4KLiNrQwuHamkTu0gz9gUX3UtqAVG3TawNc8fbJMHtP1Qvliy1tl7xKVB4yXjw+6aEQV
         RSx2aVGCoq/ZN2H4vxvQxkY458MWYTrddBn4mNYaNBTAUZrfTFkcfWT3x6+7PS+yZKo1
         tK/A==
X-Forwarded-Encrypted: i=1; AKwUvBzwLlFNCd9joj9aSbeqoXaq3t3NGeIHb7QFrOIYQLcw3TlB2fd4E6m8IkNlVyUaXwjORN9ucgskfU1+jQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWevVj5Wx5u/F+bm4g8IwMkQg4J91fAbStLfdQsZ8jPKRFungu
	VVN5qnHL/CX0pZKZtG2BdPGO4ZDfSJnhP7qicOb3E0X/lEjVx6fqkmVBEjUoS8BoABr/6Oww
X-Gm-Gg: AYBFou1VOhf1UiuHM61RI+M4phqxlsQl35MnoG89i0UD3sab2kmxyUbNcXjk7VF/Xne
	W4amAp6BuaL6tr8mnFJTUJona+lAY4iNeduTfC9fvm1MAC9cFdpOFjnITSwn8s7FCo2QGQHA0cA
	n5AxODPfvB2thApT5/mLzqSQThZTB8n5zDbpfw+YKusuWrZ4p2PAWIc/80k6JG0re4rr+ARl0gz
	g731jdGRRGwvmMQAmDks8KMPxnJAKfFOtWe4krTyeqJSqC9rrZIHYdXFjdT6TPLBRVZaRa4gk+g
	GF/Vy1Qegg4qtdBC/LcovDFwi26KF0ChWJOwcY6I3flc5YBPdcgX0Mq3aLK1AS51tQ+zYW69eeg
	GInFKKr0S52gGrALWVkdZ2Vmjq55wD0hBTNsbUTDrBTX4xu4MhW8y6YaHePhE4CSkRSoN84jm6j
	5M3SYILyKVox0O/uhfSOH4RJV6lxabplYyV5AEtY0C9S4rb3+WxDjJST/oNt6//TCdMpYaMrsl7
	NEYGWaEPLq4VcniLNPj5xrS9s08SSwsCaNhn9HK51GFnE3DHv2Or8HDUZres0A6CSWBJjwN2JE7
	SRrLG/nYi9nkCYI9shlZPhEf5Ce5CM88fsS7MCuKvKSuKXtG1+/Cq5wqml1dFPT5JB0=
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr107844405e9.27.1793442109074;
        Sat, 31 Oct 2026 03:21:49 -0700 (PDT)
Received: from OmniBook3.station ([2a02:b023:13:69f1:e78:b69f:1c29:ec5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea72254csm65226785e9.1.2026.10.31.03.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:21:48 -0700 (PDT)
From: Gianluca Balboni <gianluca.balboni06@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianluca Balboni <gianluca.balboni06@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 Laptop 16-by0xxx
Date: Sat, 31 Oct 2026 11:21:36 +0100
Message-ID: <20261031102136.24600-1-gianluca.balboni06@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The HP OmniBook 3 Laptop 16-by0xxx (board ID 8EE3) has an internal DMIC
connected to the AMD ACP6x audio coprocessor. The BIOS does not set the
AcpDmicConnected _DSD property or the _WOV method, and the board is missing
from yc_acp_quirk_table[], so acp6x_probe() returns -ENODEV and no DMIC
capture device is registered.

Add a DMI quirk entry for this model to enable ACP DMIC support.

Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Balboni <gianluca.balboni06@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index a7fa0e8c460d..7a629b35e076 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -762,6 +762,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8EE3"),
+		}
+	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
 			DMI_MATCH(DMI_BOARD_NAME, "8EE4"),
 		}
-- 
2.56.0
