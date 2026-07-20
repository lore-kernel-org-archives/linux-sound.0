Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4773D5663
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539542; cv=none; b=quUiSiPLAI4nj2kR8oKt7AduP9B23QwcxtT29PM8CHHmUZ9Db3jTZFe46r+dJG/fltUGga7V73QzihbxmnUjUQEhW4dNy6AfM5B2Q1+Bkce85vslhLmMks96uPNGpZmh4TjjpifEYlNLWOm7dOGNBcwZ+9uJP7Ku73d1KQROSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539542; c=relaxed/simple;
	bh=ngE1ViR1uejC9qMYv5QiOE7AeBgS+j6esA02JjCNPps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cyaj4c2ypzyJXTkelVreB6rUA3vKPls/iMYZMGX8ai+KJSracO8ge+H/VZ4IQ7mkpioCH6Nf+HIK1xAFzEmUwstwWYDhHcB7Zb6+EB65l/lLrTanXn8zmnv/Gfpn7ipwBaemaIEwbdp4SEuF1kZegNwq+5S2jNZyDQhns+aVUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdsk810P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlwBSM2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdsk810P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlwBSM2r"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YEov2043804
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UIZ+VAsVn1SNZ95QGAq5L0m52yqYtxRT1a/8J3q9Pu4=; b=cdsk810PBp7g+01t
	jtgsGaB6bqe7awz+CHFFzkkzoLRYq0k1QLv8MuSjFV4W5+7SdbFv/6T4M9/nmTqb
	9hSzA+WUDlYFsy43Oe2BJmMUGoCTsH/SbrIid3297qp8o4v+URjLubzvWI99IWpk
	bQBxqlqdsY65+HrEd87wxvATZbN4vLF86FWV2YI+1BWihFWMUsi++2WKU4Ew6MSG
	i3twBcvytFoyV5dmENS0paEGxzTC/InElCdcYbKTpIlG5PY1LYSoqfDZ3pI9zXzl
	thHjSjWosG9kmlp7yi+JysDF2XXnIdixKlp1Ltj19pyBdQ3sg6xMQVDoV7w9Y2Eh
	60oT1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcggt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso78688661cf.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539535; x=1785144335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIZ+VAsVn1SNZ95QGAq5L0m52yqYtxRT1a/8J3q9Pu4=;
        b=SlwBSM2ry7CX0x9VL3J19JyCnnE11UCsZsGpSSHrrRiu2JxeJ4IkXp6B9LeI+tQ86G
         QaamfKOvhUXYpSSqulA3pSgWcQbdv1veICS2P5GaLMX/FizocL1ZyaRGMvI1UI4SgycU
         pJdiCpkBjK2rJ6lUWazPpO67BJzHh4JNWx7im2boHPbobHqL4VIrYrV+DlkQzr69Y7M0
         CJmq9kjBoXVmltRxE7jcRloZ8Vb+0TontmrWYRSYIkNGZ4c7QbHuHK3k2ibyJwo5yZCI
         4yy+xfPSc47oKtpIE6gunGSakaAxOTMXowSjEUqU3GK3gg41Elp5PO0doinQ0uS2FaZ4
         e34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539535; x=1785144335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIZ+VAsVn1SNZ95QGAq5L0m52yqYtxRT1a/8J3q9Pu4=;
        b=DQGN6xxVHtiEK8S7sxab0apWspz14OrVeHSMbqnto2VgpFZpyDofAS3qILnL2OAWAD
         e5VEQ3IGbAHsnrjMiRpqBDNqZGeLBijOwDyAm1lG1xAc4kLcrZDnEzb7evxEss8NLpJ0
         BHqHT8Uzu6y6t1BxirTwgGMo5N2TdHoNg+tmSBtsnw1ezUxh4IqTWrVV9ZQcfFg6s2Z7
         bCQSaGbAZOBm405tw+8UmXES1Q2Cz+l8Z17Nql9dt9dGQnteMp6cAmEUEPujPilHrx2H
         rQES4VIiXQuFjTBs3U6rbWd9oX9xCp43kYkx2DO/3w9Y+9bjzgE2Yo9u9wfzqXGq83ey
         9rOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+LMtTpGvb73smZnvxPp/GWKS/YWWKq32jMxdPWseUvkZeG8ahOBgGs7r2ALkJMymZxjZ9MSZO9g8lQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMoyNlLlA1hRcu13E2W+mpSro4InhLT7SuQRBndOQ1MSrHCXMo
	bsyi/l4Atu08z/fEq63y2+oHgj9J3JQXYd0gfzPmevmhuQNQyYqSJ7Udlk58i1n0WyP043k8+Lv
	q7iEvV94Ox2qdSIAX9314A0Dw0iPe1NsaLjyOrIGlrKQtlo6nQDA6Wv7bST7Zhf4zNw==
X-Gm-Gg: AfdE7clGf0+M2OLjA6w+2bTUUXZFWyOfHKsBK/xgqxPgLMfUFEclarxSoFVXem/28AK
	YI1Y+fD3bmq7/hevKeGl97/iirKLX9IVKDJQUglMa8iB0GSkN9VpdkUxBlRxWaeAO35MWE7aygd
	E7z/S8hd4DQ69eCYIaW/F+2yuzQMCpc4XJkQEs0Mb8bJy9CWsoL0U7QB93gFrK7jwotinkJr47a
	1e9fxCcpNveNnyFd6/Iuq5ZwJZoPwJRZieI1MdNZyWLY3sLqChy6+OoCTVRIAdIjDvzbFkkixIY
	cWDgie/8x3FLsjZpoPeXKCQbXXaUq6ftqKlr+lnQIeI3FCPTKvrQsyGh83QQsl5sf1UeWT7C8E0
	y1ZqhhqJ3OHDZHHRorfmbZpJZ0LcADA==
X-Received: by 2002:a05:622a:8405:20b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-5218ef0b690mr68227201cf.17.1784539534889;
        Mon, 20 Jul 2026 02:25:34 -0700 (PDT)
X-Received: by 2002:a05:622a:8405:20b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-5218ef0b690mr68227031cf.17.1784539534544;
        Mon, 20 Jul 2026 02:25:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:50 +0200
Subject: [PATCH 3/8] iommu/fsl: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ngE1ViR1uejC9qMYv5QiOE7AeBgS+j6esA02JjCNPps=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel6iXQzzX/uv/M9gp2dgxe5JJKBdP3GI+hsF
 3nTXeFE5ueJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pegAKCRAFnS7L/zaE
 wyjWD/9xXLl+a9ATQzUTmx2pnk3PM2p8fPrhJGmTlsNly3ZXJZphk+eDGVbTZjMKzCAO7n+1MYv
 KC3P5qWxuw82fl5Mbg02h92WwZFcK2jLnAt1fEaQoLmiwKYIglZlCzdDXqh8SF1Ko19OroltKBU
 jwvYBAr3Ie5QCwnDEs0RoHKKubZSQ5mouhqfRrd7qbgG+uDXDg5XpHtk0rDJ5FnPKp4X8W/XhTH
 3GweCttfjt4t/fiwM2j6KmWcSD5TJ+hjv/5KeJZf2QB1Eb0Dzv22Jvlb2raqCQJUCcCg4JAK5g3
 JCWI7Te3zkgFGiJSn9nc5Z9P+Qzwms6BXzpM3qfS5u/Ks7wgnRpq+urnXYHHPlZR64p/nNNQDkV
 xrsRgx0q3ZOgObWODPSBLq7wPynL4OPLsZv9GtIVxxegKpC4h/+4N/6JMo5EzkA79PuYLzxx6DJ
 pb+qZwcXPvSLXNg6IPVLewi3QQIB2HIny/YXxqUAipY98m3orYwhyp0sHs7WLviD4uxwrtAKbjX
 zyNGMpy9b7hxIWjIDa5PPa+q68hJILk4PDf6cQWZ5PiRB+ISL4CPpMGtkvCEcAEiVOQ+rhH2bPm
 DD2NrOLMt6pvLTRgLX3Vj54Vvcw3gI3OzMXg3zRQswULvjd4UuArBK9wB0sB4LT4S9trCF2QCem
 /w1WqggZz70S85g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: _FKYZ963ZfhAAqEl1OL56fRE5Qc3nfxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXyz8YktIkGlRT
 ZUZLgjrhrTJ2piLhwZhFs62N/aOZKmo9GfgsIbuI1o0vwIvsPsFY0AlrGPG27xiGn/3zGrkkjha
 giD3C+jdVPZOzO2vqjSAMeLDCn9m0hNvoH7kb2vFt2vpNepQwCXTWqee9Lhzt38cwHA6GVM6xlM
 iv00oSCV+/Ql+J+w7gqmiplWHvL/G/TOY/ztMZ2Ad35adM9sbTkNM2hQsRPxQs4svbRqZv9Bw+V
 YNknIVPLUumZeEPt2rG/ScvCV58il/INTZ20e3Gp6hpZfNFjeG+CL9fqC+bj+ezbVmOmtSTL63o
 7NwuZwS5Ae6PsE/Cu0hCIuovtwKGFzd18Ufj0JhkuSj6ZjUJgEYiW2jUn8jyBqCcXdYciSnX+Ir
 gA8ERNpPkbz3kFRusognN+YpLvBmXf73Sd9kjmeEf/HWHbpSqnO4NO+irpB1LF53liLpQm+oK/J
 8+AHuBbyb7wv58svB/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXyy9PVUv65lTT
 cuiMXBvR9ueor6ojZOD34bdBbOCF8Px0A4umxsUKPv95WOvKmlp+mYC7RM5Lzec5JtZH5vOQ7Ec
 rjqKTpqFxI/CLhugMzAYLD1PmGwYXzo=
X-Proofpoint-GUID: _FKYZ963ZfhAAqEl1OL56fRE5Qc3nfxx
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5de98f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=le_mMX733WJEbBjyejwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iommu/fsl_pamu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index c83bbc3faad56d6ee1c89b0a7f74028af02c81e9..268a1f752fbceab4fd24013aeea5df1b6982fbb1 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -975,7 +975,7 @@ static __init int fsl_pamu_init(void)
 		goto error_device_alloc;
 	}
 
-	platform_device_set_of_node(pdev, np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 
 	ret = pamu_domain_init();
 	if (ret)

-- 
2.47.3

