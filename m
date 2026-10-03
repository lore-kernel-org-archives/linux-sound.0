Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289D4A387E
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050236; cv=none; b=Hqz5BqpMmcRtmsk20auzY1xUIscBAA1iG/Vaa0gHzhSSKxBHDkQj3pkGU49gAz3iSQqfk2kji716ywgeGgar3XlFkUnHRkY/rgKflxrFwScXEYXPPZFouyaev/6meqr5HOl/Hphy70p5WtqSLMwyitpGEgBmhlFGMG2JQknh3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050236; c=relaxed/simple;
	bh=luUnD3l+m2wgA6kRS365Flg21Wuxh5YBD2vT8dfL+C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHhFjt7m03lU6sLkLXYCDEhNfAx1YrWhZd7or7jWE+PcnyXHEcnLlZvVVusKcEw3ZBPbq3Tm1CLZxVMPvOeJ4Ey5lcUaHeeCfAx2CzYPhFv9rC0E9eNMYC0IxlYgMTp6CFlh9twtzKU0VHVhg2vC01vQf61AZXxlXQ50sdj+UIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDNHWmoM; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDNHWmoM"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-918a81965d7so8119176d6.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050234; x=1791655034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftY4s8ms9BPT/X/v3xKK/RfT0MsqyQeCqU3eZn1XFPk=;
        b=ZDNHWmoMYSRKmH15uf/0Z8BK4nwDqqDpk/yshCf25Ga2MpR9RUAKQt8mUoN1AgT4Mo
         YpAignPv0zzkTLkBvosCfChNGvR5TGX57A5T/y08rhi2rweaH+4699/GZ4bhW5zbfuVJ
         DeC03pfe3VdctE+9DFxOs6J++uVhseiUbAn8BBxPXpMvzJ3V8AW8I/u+eImQvKlVsLhi
         KUUltvau8d1I/mxgB5hAJD+tZ0gXfR1gzWAHaRr2SH2uonKwyKRWsMak8wjLWFDvsYZB
         BNdgtHI7EdvtaMz2D91qWiwyk+Vwja+1Po/+YTd/3/0vQeHvLuTwYsUp2htSOhkNEoe1
         a1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050234; x=1791655034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftY4s8ms9BPT/X/v3xKK/RfT0MsqyQeCqU3eZn1XFPk=;
        b=JdVMkB8fj7IwLVbM3SBd2MxmXuFYy7eg+dsfxO8oAZBuf0+EIH7fSS8/0rYVJ8b6Xh
         DCLPF9uqE1QkvxQhCp64h9e/9gQje+qK30hw3v6worqrIeDXPkj+TKOSJXp0nI59Bv2H
         A/QlZDXD2Pto/rhF5mvB0a/qnqDkEkEd4BhDB0OBBM4H2mfHSTWPQTE9a2wZ6KnN0MYm
         BF3WLSWTg27U+jDtwqlMYXbovWfmye0DHDyeaSiFlWcoEQQr/RQIn+oudS3XW5S8NzzV
         IyO6wjsiorcgDGYHAhsywA5G91sEePoL6Must5o+z9a+4OGX0A0wYIWAF7ecMJIdmLl/
         2QtA==
X-Forwarded-Encrypted: i=1; AKwUvBxMAm1R4p3fVIfiBqD6p2Ki/8Zbbg9Js3u/231JcbvKrRaV0goi8g0zGX4pNgwLBO7AbOiuwd6h39QC/A==@vger.kernel.org
X-Gm-Message-State: AFuF++mJ0q3h69siPPzmFVenMlDEMfr+Ke8stwFLHTWhjnpVDaNIt8CR
	fSlMc2pObqH3hdgNQwBK4kgZc3myhQxlNtwOQsvp6B9G80k9QlmB96xc
X-Gm-Gg: AYBFou2TJ/NTngC7RhEHsOD/vU9TAz01eN7fcwbgZ8EVObzENfKYvCGs/F9i0gvWI2n
	skyGIpajxBbulNEubpV8ECeVsMRvFg3PageYlh4EMYhuYNV0KtWDLgWS03joR3Itkg6EtXGFAjg
	RXfDBinJ7VhiT7CpdFNHPKzNm+PPLBhecvKzN21n5Dh0lE7yNcRNdPa/onxK6DicFQyxBWFY9du
	J2swRIgmTufhttkAAk5THrPayStMcHZcDeKmYXuuCSjms0N1oLHMAAHKhcGpcXFJbSlfMtRCcfU
	77PGDSeauKjBRSFDh84MNShgdKOIAENuNn+oScKxg5odXWG3eat95Zw7b05xBIJndeLvp15JnFM
	0pop+0yHGa8y/O96vYWqQiWOQ71dvMp11qkVtt6GW/nbP9/k8BLF0Fy9kzm94gZhHhxZCR6BXJ/
	7zYULH2FLSkBWxX2z5D5p6uRPh0wraVpcleILA5ZSZAbB5Hc/aIEQQgN95NcHj3c5Jsodrc56ov
	A==
X-Received: by 2002:a05:620a:6601:b0:93a:1264:7f46 with SMTP id af79cd13be357-93cf189ed93mr1216539985a.46.1791050234126;
        Sat, 03 Oct 2026 10:57:14 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d361bsm507217685a.45.2026.10.03.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 06/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Sat,  3 Oct 2026 13:56:54 -0400
Message-ID: <20261003175659.23536-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 since the driver
requires the load_state.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..5272a462fc49 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.56.0

