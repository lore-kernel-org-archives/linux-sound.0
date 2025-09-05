Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D00D302145
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087081; cv=none; b=dpKpiZwI9SrY+mXLriPyJARX/Uh0oZTsmIK1mLuV/wRh/ccuW82KPd6O/Yu8+AxD6j8Oz2HRSby2o8X3z3b3iLetRk0fei8M9AAJh2iLTri+lb7WlTm7rb7tfzjCpNToC1PiZtgyhUK6ICeWBJsfGnyncGHyi1ybeAjdVDMJMgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087081; c=relaxed/simple;
	bh=vmg0oYOxevk5nWCek+pJEZ1daibBK7o4kDXZ315AyTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6z9pFS9bqZCRWQXZZ+EMFLstrQ5bSJZNMEflPxgz4nkXpiU7j64oyDS8b/Pl8syKMn+bjn1LaqpE3ooZiGwNQqz3xEuVGjSSnvQWWh4dr8P9KxptXQVopBtkxIQknzmlhwd3X2cna2T0e1u+3C8mo6EtSFfzIdJaCP1jH+ySQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klSrKRYG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klSrKRYG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857aeWI008316
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qv++HabcA9y
	4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=; b=klSrKRYG2iH4+3b6N+L/zW0QrBu
	a5Rb8y6dAsWe2kBgFh7MCsjfzBTHzR1PL6QSHWkxgL6XhNsfUG8y41FWyziC/hry
	J9TukefpVzc+ntMKUo/cGr1aWH6EQi3/5V3qEN3MA7SY32B750umUAcmOMdwko0w
	moCP7QjEr1Rvn2KZLGIE1hJuyL6nOsNhLk+FW4yXvCNwW71eT6iFp5aDfudCEaT5
	gMHuuKmQjwc9HXTvIXwSkS1i48FkzuIuATRT7oyFnzqHpix0medqYtAgrMVnMAI7
	aAgOmyQqxOoarPGEkM/riUkquU/i6n+v+BeAudTC84D5igMU3qDJQFdeubQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjujav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3349c2c38so64905871cf.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087078; x=1757691878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qv++HabcA9y4aEMaW0PNus8L2anA3PVptVFL6UgEzvw=;
        b=PJV1Nkk5n/5z0zfxZ9r+meVvq90LmzbdN/hFYiZPXFKRoO3WEV1tWauKs+d+jN1ogh
         GnvHAzfAX1cdGm11BCy/Uq3hlOZTlvjYjX6gxfw3aqWdnK5psABCgLNsNrHkNxJQ0UeN
         UgEDNg7xOfbULaay9X3gMoxp6mLQKttwTkCvfp+Ha+IEDtdrnH38HIFvDHUW15AvGliI
         y4XLrbKMYEOnJtmRtTu5Oq2k6mtSztn4/Tyaqi6Bmc8d0UPldidWM2N/qCRBclfG2tWT
         9UynE6DDr00fypTDKzE0Vz6OyCSWl7D4KqXrWP0vw6YUJBsUTiJqmZtBscBZiOr6NUly
         j3IA==
X-Forwarded-Encrypted: i=1; AJvYcCVhDbcfwPgbqbDyj5ELTP2/LNNNyBZugItd+7dT2nx6QQpUnnKlwrwunX0LGFR0ppB7mVmk3IkiYvi4jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyppqBh68ZqWZa8TS6AJGDV2oq4VHodpMk5NfmGIiaf+HTkx36u
	OvxrnGQQze+1uK/IZTOOEyhTr6JY84AK2Q8wSOluKrCM+LX3BDIOfz6Y5CdLJ0DCkrKQx3Mc70R
	4u0W6CUCHN9CwIvHvkop0EStXPIqtJWSs13DEmnwkvKP3/qrSjb0jfGbkTi72BV+Z1w==
X-Gm-Gg: ASbGncvbx0ulIOJ8mjBdkBjxe+TI+Um8fYhPMJoR/wJLlMH+JZ4dLi2E/1eRpquekHD
	iKbLl/v8VN2w3E/zE0jdVTWuwkW8Qsyf/K7OUAXrZRp82sv7s7cE86hn7HivvVYsPFaO9dhYUEH
	zDmP9+3DC1rCt0hluyPWuvyD52ZOdESaFPvCO8N/1wSto0lkz+dH8ahkipkEh5Ndp90j1VTgFyB
	4RhdrHcdN+RoX0hv6Z3iRww1G8fh+0q/VtZt8nNBTes7hVy7hPR+FS6FlaEiasR9dePg1WM9u+Y
	6pzKOnNs2KcsTvsW86L0vfrpth6+ehy0y61arfKFc2uQFttGlD6A3w==
X-Received: by 2002:ac8:5c91:0:b0:4b5:da71:ce7f with SMTP id d75a77b69052e-4b5da71d400mr53788621cf.44.1757087077934;
        Fri, 05 Sep 2025 08:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfPWdh54JtUPfB1le9155RfINKV1xe4VJp0Xip0ilNblDszr9jrIP5rzVTnhlLQvIFuLirlg==
X-Received: by 2002:ac8:5c91:0:b0:4b5:da71:ce7f with SMTP id d75a77b69052e-4b5da71d400mr53788271cf.44.1757087077420;
        Fri, 05 Sep 2025 08:44:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v3 01/12] ASoC: codecs: wcd937x: set the comp soundwire port correctly
Date: Fri,  5 Sep 2025 16:44:19 +0100
Message-ID: <20250905154430.12268-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb0566 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0i9YUgi2cL8IzqKwLzsA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EOmhbwxRIiwRQ_EcB1dsXQJZLeghGG9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXx9/JrTRNDikK
 jzgSX7fD02XRbd8bY2KdtY0ubkkrxL2bNS+cB5ft6YLCsMc217mNxw4lc+GRsFzfR1WIB4YR9wp
 1zmEdmwtR5gCob3Fij8YLeeGsxM40k+n06WbRwwskpzMraO+EJqeK8orJYdlRqByCqDew1cJupl
 ic0XC0rx7vXLS1EwWDM/GP3izVYeXSML30/r1xzMu8QULDC9RPPbucefBbs1M5Po1RWCTKRSmEU
 SHmP75xIJm+xsBAo7/wJ0mvSfV6lCukbH+tkawOjecIVBr7AJ9rF1jskxjgA9MCEb7jniDJR6F/
 UghZy3x0Yr3ASil5uENsZVrDc0gBcU+eI2mhY9xSJwaYeJ56FXRWiffRCW4MGytx4rPaQFkpOXm
 uiUCW3Az
X-Proofpoint-ORIG-GUID: EOmhbwxRIiwRQ_EcB1dsXQJZLeghGG9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

For some reason we endup with setting soundwire port for
HPHL_COMP and HPHR_COMP as zero, this can potentially result
in a memory corruption due to accessing and setting -1 th element of
port_map array.

Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 3b0a8cc314e0..de2dff3c56d3 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
 		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
 
-	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
-	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
 		       wcd937x_get_compander, wcd937x_set_compander),
 
 	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
-- 
2.50.0

