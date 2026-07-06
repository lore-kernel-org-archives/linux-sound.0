Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D34D90BF
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341944; cv=none; b=XvJyxG1PfffpTXviEf9lAMtaTZ/pyoc65e9NCt5bfLy0bvNCwxpdsXaOzNKMdnnTNui3IZBhXJHKhtwazE1UGQd4M2KA2Z9lw8lAXFqIKJlLnRMk5FDGxEyZfVSi3Y8bgh15qw6HiH0B1cX3eB/qJaExQYES7AHg3Y0olSgWIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341944; c=relaxed/simple;
	bh=Zhi+F3sSWgohZECXWnDHQaM+wwr9Sm+ARxs2xrHRhPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CN+8l3d/Xkg+Uu/WYNUpRxvx4fSde3JJP+SyAt60viUpwFxJh5iflJgFR/6ZT9tzYG3cH3P90TrUH/j6gMbTBgYiEjh2t7JlOXcyxv314EYqGsRQ7OdKsThshtATFb/HYSXcb7pw6hwdHY3dpvP5NN/Vpr73ymolC8/fl6G5FjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVsoom+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmiK6Sz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVsoom+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmiK6Sz2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJRP387475
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 12:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a7M+qB1wtuA4e6xlSP5UxgmQli1U/aUaTG8atTWdnUA=; b=mVsoom+I8UuemRAx
	R/ZfNmuKeVyyU7qCm1RkTJyHry5NQoN5fYILHYU8u/80eqT660jk7F2fx5b4fsG/
	zDcEWZhwaDjuE5F1BLo/UDOSyn5DHpnJGIU2GYWrZ2X5TlRuAkUa+Fmc/nZ6lZkd
	Czc0v7XG4Kfakwx1c8TbHIvgLVi9Ltj4g6JI+XTc9cNxLi7ext3cI12DYV/oHmAD
	2GDtb4/5k0DrTL7icyFt8bynGV5tAXp4iy0WZyNVK/xusG4kbML2949Yl7shJ2zH
	dDcWOaMsVzDH8ZQeS4yN7Coed1mAYEXBih29SLCoW9NzXF3aPqUjdRfp8t1v+uj7
	4pLhBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0mmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 12:45:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e52306621so213647985a.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341928; x=1783946728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7M+qB1wtuA4e6xlSP5UxgmQli1U/aUaTG8atTWdnUA=;
        b=hmiK6Sz225ox9/GSOooDoZx4tJ0VOJ1BB28TlCUL3/Le0foJhL9S0Ivc/nLz013+i3
         5VzlFMP6QAt5V9zZET4RlJ7pHXh9FXWA8S/ERkydSzmgJ0gOQ+cpigxgTCCFQlalNsgc
         KTclVEza/N+v3HrS3U2IXBtzvPxvGaNqaJGxtV4sQzWlwCdz+AKvgopD08hzEE8LtHss
         NVJuPlpy4646nHlGPMWT6t1annELyGqlZwXDl2PBZc096RXGQrkyxfiITSxVBedeBGeM
         8dH3eu6Q5FF9Ef5vN9tL/CGSB7m0KJHryDjxtjYObjRBAo8QN+X6Mm8uuON1AJz7+0KM
         KNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341928; x=1783946728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a7M+qB1wtuA4e6xlSP5UxgmQli1U/aUaTG8atTWdnUA=;
        b=BjsQwgJ5U4K9Qrfr4IRhhUzhxzcYZ1sBe6ANVFc++PLwpBmZMSv5/6NtoXpFoelAlD
         i9ENd3YINbElN+u7InFR5/fdwksi9JcoEf9JiUyNEo5QNXQihuWpIIrsPWDfpIkzuIUI
         riER4x8qCLmv3uKcIWBXSMo4zdYDWY5bzmJspEcLXWd12yJpBjI39P18r2R6UC9Nxjkj
         mrAewBurAPWQlU0vvK6Qzz0ttEEblsB+uprLKNOXFfCQ448qp29j3+ISQE0N+fjmjRwT
         WWssgsl9k+Qc8cBMS25VLKQ/C5ccmO22Bmvho4jPTdXR0L2HOAgHooOykPRaJTUO5g+B
         tzsA==
X-Forwarded-Encrypted: i=1; AHgh+RqMn69bqtN/Sl7iHfqzr1tIcty4Gf88HAU0f3ZtyCC+KhQNupzIh6BLSZqyhYh7veQukeL237fiYF0cRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN9yhP4kyAFKlIEUih2H12hXDNJP08H29ST1i1KpWH4GqLUyB9
	d1mWovlKinxEAxoQJttqX0GrdLGn5f11oT4W2Fzh+px7f+RN0lAJTx0M7e6Un/z9VmbgcYzDnSt
	UpwcBaZ4/lzmITbquYhcLLHAUD7izIOwkLQzJim5l/y/9U8T4B7fzNwDsf4f6zMDW4A==
X-Gm-Gg: AfdE7cnk0ZvT0FTsPrXS9I9V1DXH9xpd386c3qcoRPkwXTBr75RJojW4b6dJYKo5ygL
	7CF/tiZXaqq/gFyAHbdvPTOWaCXbMsoO7wdDoaLwZPQz6O25WJb6uPu/VNR6P4szVLLY4Zwqmn8
	LIUKbD6TJ06yMuGR0VEszl5/W+GfoZrIrV1zq/2zX/9OLVVvli/xa3+yeIoNqwYTHIB/gT6eFnK
	oN7BSHWnL4yUApByWZSjqxsJrR0bnonsPBGDPn+ByMcwL2SrH2WK4hgOe7sO6KtpR56UhqmiT/7
	DPjPong1txJFn2Bdjku+SxtRwlpSELXkTS/SG0zUo3nXhCrG2nV61TD9MffsuExVODHJQzs9k8V
	8Qx4jI9Atdpg25Pz74TZBm42gHNeViMujatAYEmwz
X-Received: by 2002:a05:620a:29c6:b0:92e:45e0:2588 with SMTP id af79cd13be357-92ebb5903e4mr47961085a.55.1783341927484;
        Mon, 06 Jul 2026 05:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:45e0:2588 with SMTP id af79cd13be357-92ebb5903e4mr47947885a.55.1783341926531;
        Mon, 06 Jul 2026 05:45:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:24 +0200
Subject: [PATCH v3 12/20] mfd: tps6586: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-12-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zhi+F3sSWgohZECXWnDHQaM+wwr9Sm+ARxs2xrHRhPk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M4FydUTb0fLA7v8UHs4cH/yNkk78x4q5hdy
 wJhY/6umy2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOAAKCRAFnS7L/zaE
 w2xvEACFL1p1phfk9S+82M3HHVOICD8gtkblfhA2UFHpFsY7LhbJmM/RpC8etf2XcuDnH2Wjsaa
 7ugVGwdlyrP3oStrvCOD8hXv34YlCuu9r15uW7DIuBMUQ0lVsP5/RhYk6rI4lX2yJ4Mb61Yu4yk
 +ekCe2PEQIApK3zi45KvVkl+eD1Yz5aiXqc1aNNOVzgJVlYnGoowk8R2OceFSR9D/OSqK6etbgK
 Kg2OSZHlSosDeDMFHTbBcdfL85jRxwk2wyu2+M/V/7sFis5TmdnqjShyf7zAbDJVmKw3zdjM33b
 TgzYM80W7O0nZf0BT8iFML0Ky3MuTWgC8pt+K0WOjpadEZ3I5GmWZCRFFwbpJLIy3NXFM0Du8Zy
 DC4PlcROsGtdVB2hZRMg7Zy1kZXbx0x6NmiuaKrVjT43h8GUkrK0nG6Ap60o9hUG1/pm4deMDq2
 0nz9SGlgZKIm7UqZtXAYo6WvpHEhEswZBQXybaG6a8CaFgZCeitbc3tH1tofpjPSXP39Iqxq40+
 T0I2ZAKLZFj9oQfyLF86bX3ET1D7rwiFZXwxCvzfI/YomTynpdYJ53ELWCvRBMznaosXCTH3BE1
 /qjZfJ+jeUZHYjhdjxciVXxitOM0ZToEZzwj1w4IfNVjBkOJPCYMMfz2wrFiRzmUMDZrKrI4lh1
 J5/eCP0vP9uobig==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX2GwkWxUoUgiK
 uhdv5+xqslLT7OxCgZ+tn6tTcIHHtwTnaJyaHurOSgOPUCiRmuEHGS6FR1/ekSiC1MnGdgDrAJw
 hv7ta7kEthjqJT7o7DmIP18l3HaqMMcBbfStwIjJM1v6ZTPtmIlcxwrb/N4Au9/enBWOCPBp6+Y
 wdk05dPTUXd4R15KrQMBv6gqmr4sIeXXE8wdJWX8k+kFLysuAi3t3o+iPUzOhp1tFhV5iPM90fv
 YhdPis6cDxJVRf3p2JaPtQMMympGRAHdczuaO9NpgxOC8yhFtV0FhbHOgpp2SZD8NXULyNREGaI
 T7L1oROaYJomym59TXPCGAusrXDiAq85hsa0Wwip/IouZGAZ0iMfxD9AWjONKKPSiTajf/gFXXY
 Ol6zvXYI31yle8oRp3HnpiivDHoUY4SFPohprHKbNSqPNU08jxorF34O7ijkUaE27ltHX9KUCNT
 OQ4lXuVtOlnrQ3JKvAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXw9o4wT8wMXqo
 cjZkTnxmfR9lyOuyrVJblOOvLWAYcALrJWcwaDec1Pc6E2GoxDGlL78kl0FattT1u3GxO/7Rro8
 9ecvC4ZJDE56gI6LXsugcMr36h3D3J8=
X-Proofpoint-GUID: P6sKJrENwNYQdeax1tPsb84hvaJLE4YI
X-Proofpoint-ORIG-GUID: P6sKJrENwNYQdeax1tPsb84hvaJLE4YI
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4ba368 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ESSmVKC5p6WdXJfq0SwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Lee Jones <lee@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f5f805446603315ba76ce1fc501c908f1cec0d16..3cfd2f02b62f3cc370e0d970ec2643b638fd0fec 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		pdev->dev.of_node = of_node_get(subdev->of_node);
+		platform_device_set_of_node(pdev, subdev->of_node);
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

