Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717817;
	b=CFyjNff5+IVX1SlsCgo6JpOaMl7P9uWRk1qqjm7Rmok2f79gomQlHqfcRutdJfoiFmEw
	 4oiKOg0N53fk46ty6oIJPyXrstm78vA70mgopFcqA2a5maBpdrzhRaSGnpF3GX0ojm8dP
	 t9hW91dIZIcY0ktof+NkGtX91LUgLpjuIfmy5pPfMXd9NJ74H71W1HqfWv4xBxZBV+CUn
	 5ZdSAhmMVm3fToXqT0yBcBa5PRAgQ+wTaePF7lpaiwx68MWyKmC/eHmfSgnTTRN6QX4rW
	 cuKj+oTejL7LaZXS7yWM+7mPGQxkvgkzilotOa2sjTQURHrGMR3LOMLTXCg2aVtyIaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
	b=GwSjpYv6SxuPyU60UHfQQy/yX8rRQYXKYpEKlUZbEu8cV95p9s0vNMA9s6n4KrnNwBYW
	 z6Zua1h4AZV6lIoZFcjKY9YgEzpqTMtENpPy2SjGx0s+41bUi2cX8l5ZDYQzetolpAVfv
	 By9rspK2r3UWAfbBHGlqcMRIEe7LnWJAo6mAwmuVmIYnhk2LDvQsskzYS6Ca46k+YDZSd
	 EfI3EhpmbzpNkbl8dK2C3xuN5BSZXBTExaOHiNlepsuGkeCnZQTuwJtyqzpQ9L1MttZ4H
	 pD5x4jMCG1xJJFmP800CkHZtKaiAZFCoS63a4E41f483to/aszwJxroO18U6OsrTg9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cvtsa2e7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kcf6YYfN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DE0606EEA8
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DE0606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cvtsa2e7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kcf6YYfN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9smF2727611
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 14:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cdBo9mVe0Ue
	Y3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=; b=Cvtsa2e7SLPYu3QBTjbc3HQbPxV
	dYvVAErcU7W2buw05fHOtgtWEecIWH8GwPOQGWzUTNWvvltLrK9QLRtRdyP0G8Ts
	CyZnuFDNFLlc1KbQAx5HPY1QbTolKdRPxFIPwbTgmVK1ImmDKMTqLjhJXQwenpyi
	1RWrsBzQAyAQWWYGFzGTpgSXs2HEG1BoBtNF6ak/Q50lHa64fLmCuWBrZaUo8s2O
	igZeV8DVrR8aeJbVZ5xOMdo5Tm3umrEX3X4tnOZWKQung921HcefeKqyGRJDvq6x
	S++JkPjnNIOTJF+C2QgJRk8dRul9+brpox+9++m2MaHzMF29ufoY3VP1NDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bg79y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 14:56:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso678051285a.3
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 06:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717815; x=1794322615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
        b=Kcf6YYfNmHU3Dpf4x3hL50KAk2+6nCQucd4Qq2iXlw1Q5pxQYX8hEDpoV2YmkHv7wm
         b3gM7IQOqopCs+wNPto3XezbL9/1vkRkyIXAlLuW/RpqRN7ZNg7n6//mf3i4AAOYL1lz
         73XsYMPGGQvw8aJbpa/ippYXL11LLdn222BnVEa5A9yTkPEitV3WZrUCoAevHPPmJRq3
         fN/SkOw4OQMFhHzKkY2EFGsuVYzMnLXX4gGk3mKqTpvTEBCLa7lSGbyClp8re7yud3ZX
         yXrHev3zoXo37XAatSwWPSIlJ/HRxTFO2n2gn9E8VrmHd/w181RMcwUjhAHkP9/atQme
         67nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717815; x=1794322615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
        b=0yZFdaJ+CEAsGu9yC8jQTAfD33/Mji6hhWdtWL2nnYhflSPy8BBGvsnhNFJKDHshp9
         YTPAV57/2eQ1avZNG6lXJ4SPcCruvT5lZgGGmqpPgGlk4URx77XZKM51kTDUt44UvvN/
         F6saJPXken1mlVTkTcGJ3EImsGXEmDQMEXnm5oDrvoYkhclqBq83ODr7uCg2bieCrh28
         C1PhAtll5OsxPmHWDCxqn10rEUE6ogupbmXgvOKe3yBylC8ii/h5iJWzPg+1rax8KXdO
         dN2WIteRvaSxDXPtBTS6FWDrmnQ6t1oILe+JBZZpy/NJ06KxAvZpc27XiDodQIhP/e0D
         O1uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKMjoENyv4M31wW/bNtH73I+B0vdnL7MeMXrGchuu2mgMkTHzFfSzUVYazSi4kCwkh4XwhGBRp3p5itg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HVf+S8Dtbx5kTJZ4/augfKYTmxK1ipYrm/0oU2qBWDnwcesJF
	KjzymjEP2Yp2UnxCDAz7ycF6Vm2cVkBUol6fh40FBfP4yWwm16AvuMr+CPVCbtxEBorRYGqNqvK
	5Nxv4mWoKoi8xh7P+v1n8oI1GV3AyodpIDXgCk/ro8byK9BdXVvsnrTqwr7KB2sXzfA==
X-Gm-Gg: AYBFou1cFl5R9CRbrbyswsxFOgDgTZ8BOHe4O6s5w+rciNDvZOdy0n1iJArqLKEMcaG
	sFo7leJSV2i9+JnhL4pkoivQ08OgvenuBCarUaPh6oTrq8++tsJtELArdpH4k9t0vn4YjBp6SR7
	xeLCPJaz1RjwKfHl6xt5FP6VZvnNpFy06zeXeLg0FgrVFGxokJGu5orDcf5HEsYhVHe3H1gbnfL
	nWs4eO4jZXGs7N/T/kc208W0lIJzUNfSNPJagTWVNLkZ9sTqdfboMOTF76g+yUjvobWGDvOj0rH
	R2QUs/o7n8lfH8bEv0r7VB7gQofjSWP9Vp8M2mZMMBcjg4fjYlu2jePtUe+pkMW13DjAcNWkN7u
	joG1qf/hxa5RUzyYYDkwxrGAPXgoLkMFyr/tZWeX093QFZqRdyK9ffCaXLpbClA==
X-Received: by 2002:a05:620a:28c6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-944217b273emr2032090185a.59.1793717814570;
        Tue, 03 Nov 2026 06:56:54 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-944217b273emr2032085485a.59.1793717813763;
        Tue, 03 Nov 2026 06:56:53 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v3 2/3] soc: qcom: apr: Fix theoretical use-after-free of GPR port on concurrent RX callback
Date: Tue,  3 Nov 2026 15:56:37 +0100
Message-ID: <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yYdJk4Nh9bjDwkQjTd65xJ0ln1AEvLle7aeRhOxiKVw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYk5xDs2v2v0S9Vc3AsS28hCTTJTKLOCbDOv
 UvAu8QeIc2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2JAAKCRDBN2bmhouD
 1yLBD/9KqSkTnbvxsy41ZgeFzvUE7qXMix8YA+sVroMx3uU3IxnwPb8FCR09jU5/VpIzpM00Ieb
 R3l5BbF1ZMbypg6Xnbto0676ToHptuwYwsEKO0qgWC5wWWMEt+yCiFqBdqgbyuobMjw8KAGHysl
 WIbi2tggZ5+D2trvF1GvkROhSakpDDFb6vfwdGm3Uwk22ksH1oi8ebcw0rdHSfd26badi5xUl2r
 vSNBCBHQcZOGlTLuh0GIsLkv3RzfSgtJg7XePs3tyyA1uEpOIgjYD99UJIPUHpYDg2qVGec9q9T
 oM8lP/a6wmPYihu0dEMEaek32JEaIySPhKI1l+qoD3xb+vH2/rJIaKPX2jg2w6aj/UoNis7Eq9M
 UeohLPQOEMR21IJsE8AmLwcuMcO4rRbzN711mFLMy5JOeB8QXd8/i8KWsqYZGni14jOL/nNqmZE
 GKRrMnSdf6+9o4Q7s1lcZwq1A0e3QYLQKNLXnvNX0SLUXMWUApZNcTINfRzb4Z092YPwa199jAk
 tpUQCZBVv93Bqtjs+kO5nFkljDHkgGKzFI5uKaUN7IgcEFu9BD1Am+Jh8Coxz2vo0a1Myg0K9aT
 hQf3eh+AK2/IuYkbPli1ErCeoqtjcrTiLZph1grcVNOYEwQ3gbZDEu9fKnoJNKjzNaNE09m/O/A 1ZY4o1IfB02zcCA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX7n6wRB9OI2/G
 XDpbyOALPa5o34zWQdp5kJhoukTwU1ej0ZM6HSYWaJrVBm9qOGoLxVBvS/IAgOdCzfqYhLM4iwN
 YvJo5oquUPksVwoFI61PiT5V7BRjtnk=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6ae9f637 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bqjVDHCIK6rrShMHOGoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: nUiM9ixDHLZvAEFdF8PW92LlBVnxP59e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX57Xvtp/o4dCg
 ejb3CvBaqgGaOfnwXN8DkExsGZ7E72GfTbrlCKHqkBAXLlZ1cbsaRhWENOE2fWy0unUwvI1G1mx
 94rcBlu5YhbGY3RAChfjahNU6GFSEy3pvYdmK3k2Sgv/EKMbfUkVIDM9LuoCY5cx3N6UTqF+X7x
 huIw5NhE3+OFC14B2o85jemagobj9iJP598VlLv9tgvas7SDoVtma/6LQG2yCydj0LRH0/wBeAe
 iGfmrfaSLTK2b0/6VOWOULfBsoRLdITVtoSxp4b6TlgxRHX3H7hwlz5aRotZTbR070ch4maWuoL
 aiY6cRcfg/1cHr5xN5snTdwkDR777MSvtFz0VmKfLrNW7hJ2ncAcivsu38fjafpllnlZaGIBw9g
 xFtpXw465yzwvLAMmwT+rh7vfeBx4HY+em28Hr7Ho6R7hzpOMer0fKAVMkcj2r5YTTfbXHnvtfu
 ni65eYGARa1CnJe4Asw==
X-Proofpoint-GUID: nUiM9ixDHLZvAEFdF8PW92LlBVnxP59e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059

gpr_do_rx_callback(), executed from the RX workqueue, looks up the
destination port in the IDR under svcs_lock, but then drops the lock to
call port's callback.

Concurrently closing a graph calls gpr_free_port(), which frees the port
after removing it from IDR, thus a theoretical scenario (not reproduced)
is possible:

  CPU0 (RX worker)                  CPU1 (teardown)
  ----------------                  ---------------
  gpr_do_rx_callback()
    lock(svcs_lock)
    svc = idr_find()
    unlock(svcs_lock)
                                    q6apm_graph_close()
                                      gpr_free_port()
                                        idr_remove()
                                        kfree(port)
                                      kfree(graph)
    svc->callback(..., svc->priv)   <- use-after-free

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1ebe255f-a874-46dc-b7cc-455e7bce402f
Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. New patch
---
 drivers/soc/qcom/apr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index e303562526d4..80056bd0686b 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -83,6 +83,13 @@ void gpr_free_port(gpr_port_t *port)
 	idr_remove(&gpr->svcs_idr, port->id);
 	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
 
+	/*
+	 * The port is no longer discoverable, but RX worker might have already
+	 * looked it up and be calling its callback, so wait for
+	 * gpr_do_rx_callback() to finish.
+	 */
+	flush_workqueue(gpr->rxwq);
+
 	kfree(port);
 }
 EXPORT_SYMBOL_GPL(gpr_free_port);
-- 
2.53.0

