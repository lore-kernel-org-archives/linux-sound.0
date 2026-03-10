Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29EB285419
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115757; cv=none; b=I58c6O0wLIWHDTJuqIsOpzTihBW+MD0t4I0YJcFA4mBA2ON3YvsDpglUgl2+O7T0sjQOxjrIjqViHMz+1zJiw28SthpIfQUQmFcWa9s0fIoqAYM7QBGexagEi5y4Hmbhjkh4OljP8DF08qTisxL7rb8ygRg4436SFmw1T7YaALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115757; c=relaxed/simple;
	bh=j0BNFKTy6YhD81KGaBZfVR4UgpqXpUIBSqeGb+WvIjw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DYV0P7NSiMu4+CpVoJHKdiWVAZLpzpMjYD1NGCB8OIK6Xn8ptCN9t2ldoYYMZ/azBn18g+Xt/dAlQwp8Fhjh4dwTvW6+e+9XL13WQ8bRyZl9mpGxK2tbYo3kCmvkHLUAOBuwzUdDj6l3LeFdf6p3hwPKogLx73yCo0ZvTkKItxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxuXTtRz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aufOQDiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxuXTtRz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aufOQDiT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EZ1D1900138
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DNXiimRcU/ja8ktsL318nq
	SuUFiZZt63sxQ0hRN6KkQ=; b=cxuXTtRz+nA/G+pqN3wV4e/OLdSaf63RH2dZ9U
	44nKSgLlgKKnmEuzzWn9PwHYIE4DuH1iFphH8cdU5l1561GwtUGhwKzOjhSDmn0l
	h/xUTJz0lul+yXE3h2SwAkmNxhBDnLosVSmMWc/tDFI1HjtKkzO7lZBtrGTGi20L
	JQFG3uoJiS2MWqKRmonlfUPdnJq9DGu+En/nbn/Gi60ckpR1xpb4o4tYbY5JsbVM
	9JREnjcAXf6z5op8KI/Pi8MoEtk2lP9f3v2hD3RRKHGic6Jn2P0GiIQ5z1aYgdmL
	HByJY7T9IjF8+pYCCt2pnWXtcboA/gZCSttdOkzOV2CAXgWw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsabk51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:09:15 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-417323e3806so13847210fac.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 21:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115755; x=1773720555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNXiimRcU/ja8ktsL318nqSuUFiZZt63sxQ0hRN6KkQ=;
        b=aufOQDiT8TBPCA2Pz0/CPH/aG5tvGwciWUeF6W/2Txy2Kvemab+eOrFTnyEx5iXiaK
         KNoL98K4u6YtnmaQAo7HXkGnIR6jlUQF8LDgYp0yYi9bm68EToZDbDEz/xEIP7bi/WB7
         7QozVWNwpdP4pY5/NGbOoVfRE+OLMxKGuL8IJT2FEz9DEzsbQ4wcxQd7Ltwb1OWMRP1b
         gPRv7eqdzg4NjqbrilqSgmJonJM+fG3Q3re7huhMq28mXLVK0FvEvVYi3UAkKbv/FwRJ
         wWqXH80J8Yeh54YOZka9sykGOY9MD2ZsjZ1oZuh+/JtuCUYXgUbZBrj3V6JkZHt4RsCP
         eOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115755; x=1773720555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNXiimRcU/ja8ktsL318nqSuUFiZZt63sxQ0hRN6KkQ=;
        b=GrZoYrYAkqR/0HmRHCpPbT6qoMuKa+GODtOexk+2nMJqXWI5NPtXOSM33KRvsp5HLN
         N5tTdCClxK/6RQDKwk+xtEezMbCwd8pTACdvHiI4P6R9Abf/j80idESWrcewDalsHGJG
         CX+jBLUmq9R6F/mzBa3LYK744mvKbmCK/nVWclMv/7KenMcWITrkzIxj99aZjZsaZbZA
         KggZ2mF4Y35cWFcj9zjGftbDgD+7B3o5npG0WBXwhib76Nty8KC/H99WbQoQMpTMCpuu
         dYvARd4T6XF/NIvUc0dHxVlAE2WVjf5DJ+5OziXrdp2pgfJ1VuKe8y1zYUVsuVt7MERr
         /xcA==
X-Forwarded-Encrypted: i=1; AJvYcCUCAzP6nnF759dSuX787WA52cIWrRZYsQz6vc9MdVC37ueUG8EgHwn/W6GMN+CL0wrYo47AHuZD0IL3Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zHJujJ6Nr6G2MpH/b8g4jbNYpp4MUSiC/3y8KX+JnC8HjYcZ
	YZW2IyTmZxQHUFkBxGN6I+bZO184BGbIQFRqSDxt4M75tnJiF0ri+z2ZOnk2gZCET7gA3EXo2O3
	hDGAfqAuIoiokMNh/3EiQtr31CcfxstqR24qlhNG32hIIc05FVQt4W3FEi/oKh6Rfig==
X-Gm-Gg: ATEYQzzdmQ8Q7yV9CVr2XKw3JJGmj0v2F+xZ2oGn50xp5IoE9TSo5sIDobesMYgW/0O
	TMlcb1SQXmT6Ep8CGD1Gb6sIvyVuBjXhdLvVV9N5hkptDPy2xx1ArlUhrS0XsjXkR2QYfrrJhIg
	2AlCLIBFOJaaABr3ptd4GanGT/qCbHqMDy99gDdeX1fKTbaKO8cPJZh9GPH5/mZVSOKh+H/tapx
	aNtWoZgETl7k+cp151LMJeHtgbSclB7L67lRTcz5INt4YoUNey1n81jsu1jzcu6LtXIV5d3Wuec
	NfkAq1lM22eS89TUyVsRNrC8IHPJ/q9WgEKGU7Ume3aricrWnovM+4djRLH1y+EmWWb3vHgwgG9
	bwAhMPR+RFYrL6Wm6LPGGxiFz4gn01PtzT/aiVDC4ycg=
X-Received: by 2002:a05:6870:a919:b0:3ff:4ab4:774c with SMTP id 586e51a60fabf-416e4448983mr8187456fac.43.1773115754886;
        Mon, 09 Mar 2026 21:09:14 -0700 (PDT)
X-Received: by 2002:a05:6870:a919:b0:3ff:4ab4:774c with SMTP id 586e51a60fabf-416e4448983mr8187440fac.43.1773115754466;
        Mon, 09 Mar 2026 21:09:14 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/7] slimbus: qcom-ngd-ctrl: Fix some race conditions and
 deadlocks
Date: Mon, 09 Mar 2026 23:09:01 -0500
Message-Id: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2Zr2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ND3eKczFzdvPQU3ZTUMl1zE0MzszQjyzQDY1MloJaCotS0zAqwcdG
 xtbUAiaawhl4AAAA=
X-Change-ID: 20260211-slim-ngd-dev-74166f29f035
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=j0BNFKTy6YhD81KGaBZfVR4UgpqXpUIBSqeGb+WvIjw=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lo/sm0Oc/SNYaBVYkBX9corkkNtHKlrnJ7G
 33ol92WVd2JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcX26BAAxYhAAgDtmIR4dpqW+cOKTpmOCnBn859XYM+y+yq
 5tvkpSWjhgFBfpAcY2IwtEPvf7G3JVHdxkBZNZT9E5c39/RfY25ivjVXBQoutkZNa6RzgoISnjH
 PBOTja8kFKbnFlX/o1L3KJeor2KAxjhaFKXT5tzjhpnARdWZ45dmxdpPQ8QMPZw46ueLmfJH5dA
 uRO8CU2hWAGotrYZqwJKCecSFrHNTsp1dvoMihjBj3UYX2unvZ7QNOGKvmGEuj034M8ngo1opQW
 4Ulv7tVih38/sDOgGkpKt4EbIwt5hWAHC4O43WlBfnwzkzOJTQ+J2Xi4hJaFKEB3gcRfXM6GziH
 uhceCPWvEun8xJCO/Kpl7pJbmVKTY3QzwFa8bJayOQIQAXjJkSKLEz2pIDK4Yq45vO7ujzhX6pK
 cbMmtTrimblqZcnoW9HGfhhvV6kM6gs5uU27Z2MPDnaMyyoAXcgwqsA4cZG+HllmUEtuKgwm8v5
 Uv0oIxPeQv2Jtian6T7JFEBm/hhUC5VruOWhJbF615fFFs5B8qcRDmIctedaavrKvgDA10UInlc
 PvjY9n1E0XGw5+G9Sf+snp2yIgwR7nt2vonyqCmwS7VxiZ7bdaWhu3BoC1mRgEo5c8yedOeyV+T
 0CniPghvvexKeT53UNVy+hFGUXzsenQvyVeSBsb9QC/Q=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: A4Zeu6u8DA1DzacA2Dg-iNPk7svR7yPn
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af996b cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=N-1BD95YXHRArY_OaYMA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX3tkDD2wlVdUp
 HtzTclHCe2GTA43vY9zfTzXPLazQr2oUbogQ2J92vkDVVnzTNKoMaoXILel9uJBujjbuDsgWjbL
 ZYw/TRoHZb6XxryH3+eOxW7p1WD47G7+NzlKt0+f8RWeMNO82q9NRF/u8kqK6aikXpbmPZI4mX1
 owQ2jWFRFN/TziUsxmWA27miB1t6Q/w0bCFghrq+WswC/IMw8tkiM8/j4ixVsPR3JOi6J7qPoc1
 EE50Fbze7X4VKuj8cMu63oLc8/KPeObQp9+71Y7IYaLbVzkzPQrWSaDX8n2frmN4LZQKcn7HOV3
 z0BgnQM43dNm2fynDr1qY/rXppSb5pYb5e6fLa/3O2ihA9zdbL7jLFupaVUUD6E4nM4VP/zXQwX
 XA5fItgUa9ElKc25aSJ5crj42HCn0Px45qa9Cqy5/mrJ+3lIIi6pFOwXR6W/DrEuyRk94DQW3RY
 CcCTFe++/VvWg+VY/NQ==
X-Proofpoint-ORIG-GUID: A4Zeu6u8DA1DzacA2Dg-iNPk7svR7yPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031

When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
SSR notifier will fire immediately, which results in
qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
unitialized work_struct.

The concrete result of this is that my db845c/RB3 now fails to boot 100%
of the time.

In reviewing the problematic code, a few other problems where
discovered, such that platform_driver_unregister() is used to unregister
the child device.

Lastly, with the db845c booting, it was determined that attempting to
stop the ADSP remoteproc causes the slimbus driver to deadlock.

Note that while this solves the problems described above, and unblock
boot as well as restart of the remoteproc, this stack needs more love.

Upon tearing down the slimbus controller (when the ADSP goes down), the
slimbus devices attempts to access their slimbus devices - which is
prevented by the controller being runtime suspended. This results in a
wall of errors in the log, about failing transactions.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (7):
      slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
      slimbus: qcom-ngd-ctrl: Fix probe error path ordering
      slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
      slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
      slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
      slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
      slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock

 drivers/slimbus/qcom-ngd-ctrl.c | 127 +++++++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 47 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260211-slim-ngd-dev-74166f29f035

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

