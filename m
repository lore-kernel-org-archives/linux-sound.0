Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787555;
	b=M/rvhRo39P0beowpn6UkVJHCRgaqIlss4urz9TUuRPs8lbqDAZqdMbQDS6jCh57jXr1I
	 12P2fxhOigqvwbcVCLXfvUTGO5gWdU9BmdCXt8rrj1N/rW9z6yC6FQLVawhI1cN9WjGRX
	 T1s9XFHbUNKVbBcO3/w1ez2hfzp/CBFjajFiEdougw7ettDFw0NKPJtracIKi+w1shGRq
	 lHJs3QhUOM+oGPj8bAWcDAXTZ50ebA0RUgkY6W92Cg6Cl8byAN7RGZrXgk8WaQIHEv0NF
	 ovHZFL0fPOe+VSZPrdB126zknhda6I8uO8MvU3Js+KUL4hpNtukVJVEbCCiYeaN1Idw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r7xKLfqy/e6hCqem5hjXurE7qVFU1vIy7xvRioRqWS8=;
	b=ubr3yieIxP3iYSFy6daQ/TU0eUvqKfaPRzZ7Dn7qZLAWXdz5JxqblJ9KR6lTtNeu6QYF
	 OG9CIvVFiuP0nUbW45+gkuXGnI9HkKN+w/leGhdN1BwDEOyy3HsXOjJEf2NRqktNqwYqh
	 luONUFTmOfVs4ToSP+E8QGTXscSVknwDb4NWa8NAiBUMHYCteK2zi9Wu9B5I20WXDzN+g
	 pP8FikTZvwaAjaIzp6ZRfsQEUfNnIsFOpS8Wc5V3iXlEQwRcWfZxhAFN41KBacOJwD+3+
	 qUmIt5WNQfAfsXZP7Sdled+/O6wbhduVnOfGss5SC3acKEWxZo8iDaaUDvnwojuDsRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJBqQ4rK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfwivORx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C9606A323
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 13:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9C9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJBqQ4rK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfwivORx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChH5d515744
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 13:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7xKLfqy/e6hCqem5hjXurE7qVFU1vIy7xvRioRqWS8=; b=OJBqQ4rKEDUY6Jgp
	w/lbSOTn1ocRvV2CH7tiHY6YGwcdvqi9NCz7yzAAtOwrFcKTOpwgFQUD4sGSX/+/
	CPpKNo/nUdl8g82TC6IsBz9Ood5FV6Rsol5UqPelKhJDNqdpELJZXDCTvfbVDiMt
	nSDJ5eRzVlNXxMKHrcSSYxSl66m1PIot6CujsjjeJUEmCTcum7mJtBUxAVQzle3E
	iMbOC+93ufH0FxoQZygmkkIHCsE+f5uyZxcGWZrdxEClkxCBK9H5CUI7lP8NiDDJ
	lqsQLHT4xnl4j5Dn8N1WBJB20NNbN8rq3sI2aZTov1ju32Z0jjiTdpRI519fC5PT
	xk960w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49b91h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 13:52:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b7614e9762so5787713b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 05:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787552; x=1796392352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7xKLfqy/e6hCqem5hjXurE7qVFU1vIy7xvRioRqWS8=;
        b=hfwivORxJf0CcF8wiy9hFmh/oypPh2l/FHmnfj8Ah1cXZu1v92xOsDsoPfyDAPv7Ps
         cKIiRoOJVBfC1arJsyEckpqFCLshMfsUhO4SWoU2ifF0J70/aqLpC/fLk4XKM+h7OxjS
         6ru1pLAonCbmr8V4ghuLnxtlkntEgpDgKEqgWvGH5CLPw4Xw/iNUj/aHGLmd/zItzErn
         mjo8gScYwGvi6VILiYjSDU4t17G0TIGXQAmVgSa6ykFn3vPMEKYwKBu8lT/3tkZzduC2
         EG0emJtIRNe6ZAi4QxcMvQQlNDCZ0ozd9QCBu8aJysjUkVN2WbIpeSF4W21agwNy3+G/
         +Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787552; x=1796392352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7xKLfqy/e6hCqem5hjXurE7qVFU1vIy7xvRioRqWS8=;
        b=GiA8qtLFvhRQCfryqlq5SIbV/T+b17ubQHlqcxUBBX5ExPPC4eGJIktgmSf+/o3yMg
         Dlm9zzCKI/xf63CmoZIQiD1eg5Me+0YahUypSImj0eG+6ynm7+wb5oLWn2uXeNsBnlqc
         9EAzTQrhGpYul06EnEpPcOgeaDdkUirJy0GMgOPGUFzj8k2xM4KQO2DA0Cf1fSmZ/VVC
         VP1VntwIqFIlZcaZWqfwzy51K8NUyNrCjGfM7c1aVzOp1XAvkq1XVOWB4Lnd4DC2mjYi
         J+o+a4qni/0bkE0Jsq4g48NNEtBamCfqAQCo8zIdXOcAQZ2RCMN3V3SiQFft4xMxA+su
         sy9g==
X-Forwarded-Encrypted: i=1; AL+hErGxg3ZtFM7Ly4SyiROfRyBAMthrvtmvgKbEaaRIEgHHJ3bIJaLTi8gnrABQyPkvpr/ot7Il56w5k0O04w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9G2vHIcGYG6XE/T6J3BHK1RBt1UUc31Zdi3mG4ERUUQdx1+9Om
	iBhGlVGNzcd5XxTlQ7PT2z0jFjh9tTr7Z1GvJl8qp09kkbPw73xt56khzy+18wP+YLKeJFgZ5eo
	Rng1ATZ7o9U/ZwfIQh7LQc6J7eQMKpvW/UwRFwydmUyhtQx9pYrld9i+aQ5xfrAHv6w==
X-Gm-Gg: AZFdTZdNrgNtyia7fm/PZv5ySPBYpRuPLCeQD+tc/FG30cE66UwIXYUH6FR2I9liOHq
	lUyZs3SfFbUMxal+TX4FxCqWPqv+9I0h70TDuy/FPbKJzL7XK1PkiEdkqEdtdNA1JFtVrD5t4tF
	4SmKuiKClc8X4ZtH4ifeLfZzYWce01C7E49NRsWHhNCq0+lr148ErBxzQJXCtEc2vghEUsgAgZd
	RxxLkewqkHB0f7Acv31oSPNctcsfjo6wkBnbT45lIoW0Gh+Am0kz+M9fE4LkdjbMN6ft8VKsULi
	nKTLaNbhGoVTmV2UpYwgb3qjaQ+CiPBtL+Xm2Jz0zwPSd25m0XWk956om4Hpyc5m1TAz/5GE6aV
	vHuzp/hU+ucsOUSTGhOaC+dV33pVRIizIr/BteAL3F+hfr9swEM0vPrtGKbKYyHnKwI8ZSxb3nO
	/d4Xc=
X-Received: by 2002:a05:6a20:6a1b:b0:3fb:6e73:ce40 with SMTP id adf61e73a8af0-4014a27e8famr25862280637.4.1795787550362;
        Fri, 27 Nov 2026 05:52:30 -0800 (PST)
X-Received: by 2002:a05:6a20:6a1b:b0:3fb:6e73:ce40 with SMTP id adf61e73a8af0-4014a27e8famr25862218637.4.1795787549217;
        Fri, 27 Nov 2026 05:52:29 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12747353b3a.2.2026.11.27.05.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:52:28 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:21:48 +0530
Subject: [PATCH v3 2/2] ASoC: codecs: wcd9378: add non-SDCA (mobile) mode
 support
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-b4-wcd9378-v3-v3-2-397e5ba2da55@oss.qualcomm.com>
References: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
In-Reply-To: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: HIeRjnOFLVLsjfSIXmUkJSVGwuTP2jNY
X-Proofpoint-ORIG-GUID: HIeRjnOFLVLsjfSIXmUkJSVGwuTP2jNY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXyqhtChAgZ3lP
 bkkFVXEsukNsZ+fvnrvHYMNGvJOuWbEzTZneG/MjP0jsncFAAOd42cuTJGsxrBtQM1eRe+LRYzp
 y661EVlK4usQYlURlYT76tItbI2Kp9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX1/lKyDFzDUxi
 MNabnMYIe2wRAJCTOZM6MPy2cD51GUm+LgWGYcNg0EQVO4nhogLpQuHh7gCY9vwxLP1puEaEmYC
 FItJ9iG9Wc6IddsLavS8Gxk7w0O/BsenAaovOGkYqLC6M7Ui4dcWhoQNJS/XOJB1qZqG0Co6+oy
 LKuEE05JyWEs0T1ObbJA16VtZj+VPjAw0p4CJgV6O7AsYcmOZBqXDSxA4xvqzY+5oWD3EkRWlUa
 vgMr7TY3Pw+KznkEGOeIpWXlQDPbSFF3rcA44bb8jo0KZK3tOFeCQvJIBlbx2zK9pY1pweIlMnN
 dbSw0ldnCaaS5f5RCnPhgAXqSjSMT46VNoKF+1YolxCR40x2qBG69L94vyGJGvasGXSITTkn6fP
 YOZNc565t8642ebuX9uuQkm1KcnmAvupZHqHeKtuLoz7p9l2kwxmCu/fN/UgSjXDyMJp1hxE2R3
 4ru36vVLiaXEnpX7b5A==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b098b20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=GYSh3LzNAAAA:8 a=EUspDBNiAAAA:8 a=KI1gIwARusuGoLxQ3uYA:9
 a=QSFvuLkN4kWOp8Rv:21 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoOABgeZipijB_acs4fv:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

The Qualcomm WCD9378 is the audio codec found on SM7635 boards such as
the Fairphone 6 and the eliza-cqs-evk. The silicon is fused either
SDCA-compliant, which the existing driver already handles, or not
SDCA-compliant - the "mobile mode" fusing. Add support for the latter.

It pairs a WCD937x-compatible analog core with SDCA-style function
blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in sequencers
perform the analog power-up/down autonomously: capture is started by
programming the ADC usage mode, requesting power state 0 on the
function's power domain entity and letting the sequencer ramp the ADC
and the mic bias selected through SMx_MB_SEL; playback is started the
same way through the SmartAMP function.

Both fusings carry the same SoundWire device ID (manufacturer 0x0217,
part 0x0110), so a single SoundWire slave driver serves both and
dispatches on the qcom,sdca-compliant device property. The
SDCA-compliant entry points are left untouched; the redundant fusing
filter at the head of wcd9378_sdca_probe() is removed, since the shared
probe now performs that dispatch before the SDCA path is ever reached.

The mobile fusing puts two SoundWire devices on the bus, normally on two
different masters. All control registers - the SDCA function blocks and
the analog core alike - live in a 32-bit paged SDCA control address
space reachable only through the capture (TX) device, so that device
owns the codec: it holds the regmap, registers the component and the
DAIs, and aggregates its playback (RX) peer through the qcom,rx-device
phandle and a device link. On Qualcomm controllers the paged access in
turn needs SCP address paging support in the controller driver.

The SDCA function engine does not survive SoundWire bus clock-stop.
Every register keeps its value (so a regcache sync restores nothing),
but the sequencers ignore all subsequent power requests, including
forced trigger and soft-reset writes; only a codec reset revives the
engine. The only way to avoid that is to keep the TX bus out of
clock-stop, so hold a runtime PM reference on the TX device for as long
as the codec is bound. The FUNC_ACT class-load activation is likewise
done with plain writes rather than update_bits so the 0->1 activation
edge always reaches the wire regardless of regcache state.

Scoping the reference to active streaming and reviving the engine with a
codec reset on runtime resume was considered and rejected for now: the
reset tears down every SDCA function (including future jack-detection
state), forces re-enumeration of both devices and adds the ~65 ms
class-load ritual to each stream start. System sleep is untested and
will need a reset-based recovery on resume, since a runtime PM reference
does not prevent clock-stop across system suspend; that is a known
limitation.

The TX analog gain field steps 1.5 dB per code (+30 dB over the 0..20
range), measured acoustically on a Fairphone 6 against a fixed reference
tone. (The wcd937x-family drivers declare 0.25 dB steps for the
equivalent field; whether that is correct for those chips has not been
verified here.)

Capture covers ADC1-3 fed from AMIC1-4 plus DMIC0-5, with mic bias 1-3.
Playback covers HPHL/HPHR, including the per-channel companders and the
FU42 channel volume controls. Channel volume only reaches the PA while
both companders are off; with a compander on, the PA gain instead
follows the gain codes the LPASS RX macro sends over the dedicated
SoundWire COMP channels. MBHC and the EAR output are not implemented
and can be added on top.

Since one module now serves both fusings, rename the Kconfig symbol from
SND_SOC_WCD9378_SDCA to SND_SOC_WCD9378.

Verified on the eliza-cqs-evk: headset capture and headphone playback at
48 kHz. Verified on the Fairphone 6: handset mic capture through the
LPASS TX macro at 48 kHz, repeated across reboots, including UCM-driven
use by PipeWire in a Plasma Mobile session.

Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig        |   23 +-
 sound/soc/codecs/Makefile       |    4 +-
 sound/soc/codecs/wcd9378-sdca.c |   14 +-
 sound/soc/codecs/wcd9378-sdw.c  |  636 ++++++++++-
 sound/soc/codecs/wcd9378.c      | 2201 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd9378.h      |  324 ++++++
 6 files changed, 3162 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6239de3afa5a..965284094cbe 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -315,6 +315,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_WCD937X_SDW
 	imply SND_SOC_WCD938X_SDW
 	imply SND_SOC_WCD939X_SDW
+	imply SND_SOC_WCD9378
 	imply SND_SOC_LPASS_MACRO_COMMON
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
@@ -2593,16 +2594,26 @@ config SND_SOC_WCD939X_SDW
 	  The WCD9390/9395 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SM8650.
 
-config SND_SOC_WCD9378_SDCA
-	tristate "Qualcomm Tambora (WCD9378) SDCA codec"
+config SND_SOC_WCD9378
+	tristate "Qualcomm Tambora (WCD9378) codec"
 	depends on SOUNDWIRE
 	depends on SND_SOC_SDCA_CLASS
+	select REGMAP_SOUNDWIRE
+	select REGMAP_IRQ
+	select SND_SOC_WCD_COMMON
 	help
 	  This enables support for the Qualcomm Tambora (WCD9378) headset
-	  codec when driven via the SDCA class driver on ARM platforms
-	  without ACPI/DisCo tables. It provides the static SDCA topology
-	  and SoundWire data port properties transcribed from the factory
-	  ACPI tables.
+	  codec, found on Qualcomm SM7635 boards such as the Fairphone 6.
+	  It has three ADCs for analog microphones, mic bias supplies,
+	  headphone/earpiece outputs and MBHC.
+
+	  The same part is fused either SDCA-compliant or not and both
+	  fusings enumerate identically, so one driver serves both. An
+	  SDCA-compliant part is driven via the SDCA class driver on ARM
+	  platforms without ACPI/DisCo tables, using a static SDCA
+	  topology and SoundWire data port properties transcribed from the
+	  factory ACPI tables. A part that is not SDCA-compliant is driven
+	  directly over its SDCA control register space.
 
 config SND_SOC_WM0010
 	tristate
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 459a2aa463f3..2114acc430bb 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -369,11 +369,11 @@ snd-soc-wcd9335-y := wcd9335.o
 snd-soc-wcd934x-y := wcd934x.o
 snd-soc-wcd937x-y := wcd937x.o
 snd-soc-wcd937x-sdw-y := wcd937x-sdw.o
+snd-soc-wcd9378-y := wcd9378.o wcd9378-sdca.o wcd9378-sdw.o
 snd-soc-wcd938x-y := wcd938x.o
 snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
 snd-soc-wcd939x-y := wcd939x.o
 snd-soc-wcd939x-sdw-y := wcd939x-sdw.o
-snd-soc-wcd9378-y := wcd9378-sdw.o wcd9378-sdca.o
 snd-soc-wm-adsp-y := wm_adsp.o
 snd-soc-wm-adsp-test-y := wm_adsp_fw_find_test.o
 snd-soc-wm0010-y := wm0010.o
@@ -824,6 +824,7 @@ ifdef CONFIG_SND_SOC_WCD937X_SDW
 # avoid link failure by forcing sdw code built-in when needed
 obj-$(CONFIG_SND_SOC_WCD937X) += snd-soc-wcd937x-sdw.o
 endif
+obj-$(CONFIG_SND_SOC_WCD9378)	+= snd-soc-wcd9378.o
 obj-$(CONFIG_SND_SOC_WCD938X)	+= snd-soc-wcd938x.o
 ifdef CONFIG_SND_SOC_WCD938X_SDW
 # avoid link failure by forcing sdw code built-in when needed
@@ -834,7 +835,6 @@ ifdef CONFIG_SND_SOC_WCD939X_SDW
 # avoid link failure by forcing sdw code built-in when needed
 obj-$(CONFIG_SND_SOC_WCD939X) += snd-soc-wcd939x-sdw.o
 endif
-obj-$(CONFIG_SND_SOC_WCD9378_SDCA) += snd-soc-wcd9378.o
 obj-$(CONFIG_SND_SOC_WM0010)	+= snd-soc-wm0010.o
 obj-$(CONFIG_SND_SOC_WM1250_EV1) += snd-soc-wm1250-ev1.o
 obj-$(CONFIG_SND_SOC_WM2000)	+= snd-soc-wm2000.o
diff --git a/sound/soc/codecs/wcd9378-sdca.c b/sound/soc/codecs/wcd9378-sdca.c
index efbbeb3dc721..58727df962e8 100644
--- a/sound/soc/codecs/wcd9378-sdca.c
+++ b/sound/soc/codecs/wcd9378-sdca.c
@@ -979,14 +979,6 @@ int wcd9378_sdca_probe(struct sdw_slave *slave,
 	struct gpio_desc *reset;
 	int ret;
 
-	/*
-	 * 0x0217:0x0110 covers both mobile (non-SDCA) and SDCA-compliant
-	 * fuse variants. Only SDCA-compliant nodes bind to this driver;
-	 * mobile-mode nodes are handled by a different driver.
-	 */
-	if (!device_property_read_bool(dev, "qcom,sdca-compliant"))
-		return -ENODEV;
-
 	priv = devm_kzalloc_obj(dev, *priv);
 	if (!priv)
 		return -ENOMEM;
@@ -1077,4 +1069,8 @@ int wcd9378_sdca_system_resume(struct device *dev)
 	return sdca_class_system_resume(&priv->class);
 }
 
-/* SoundWire slave-driver plumbing lives in wcd9378-sdw.c. */
+/*
+ * The SoundWire slave driver lives in wcd9378-sdw.c, which is shared
+ * with the non-SDCA fusing of the same part and dispatches into the
+ * entry points above for an SDCA-compliant device.
+ */
diff --git a/sound/soc/codecs/wcd9378-sdw.c b/sound/soc/codecs/wcd9378-sdw.c
index 52295e7646cf..cb9a9fc15272 100644
--- a/sound/soc/codecs/wcd9378-sdw.c
+++ b/sound/soc/codecs/wcd9378-sdw.c
@@ -1,51 +1,641 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
-// Copyright (c) 2025 Qualcomm Technologies, Inc.
-
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * WCD9378 (Tambora) SoundWire driver glue for the SDCA compute-mode
- * codec.  The SDCA topology and hardware-specific probe logic live in
- * wcd9378-sdca.c; this file carries the SoundWire slave driver plumbing
- * and the module boilerplate.
+ * Copyright (c) 2025 Qualcomm Technologies, Inc.
+ * Copyright (c) 2026, Jorijn van der Graaf
+ *
+ * SoundWire slave driver for the Qualcomm WCD9378 (Tambora) audio codec.
+ *
+ * The same silicon is fused either SDCA-compliant or not. Both fusings
+ * enumerate with the same device ID (mfg 0x0217, part 0x0110) and with
+ * SoundWire class ID 0, so there is nothing on the bus to tell them
+ * apart and one driver serves both; the qcom,sdca-compliant device
+ * property is the discriminator.
+ *
+ * An SDCA-compliant part is a single slave aggregating both data paths.
+ * Its static SDCA topology and its probe live in wcd9378-sdca.c.
+ *
+ * A part that is not SDCA-compliant splits into an RX and a TX slave,
+ * usually on two different masters. Only the TX slave reaches the codec
+ * control space - a 32-bit paged SDCA register map - so it owns the
+ * codec; the ASoC component and the analog control live in wcd9378.c.
  */
 
+#include <linux/component.h>
+#include <linux/device.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
+#include <sound/pcm_params.h>
+
+#include "wcd-common.h"
 #include "wcd9378-sdca.h"
+#include "wcd9378.h"
 
-static const struct dev_pm_ops wcd9378_sdw_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(wcd9378_sdca_system_suspend,
-			    wcd9378_sdca_system_resume)
-	RUNTIME_PM_OPS(wcd9378_sdca_runtime_suspend,
-		       wcd9378_sdca_runtime_resume, NULL)
+/*
+ * Both fusings enumerate identically, so only the device property tells
+ * them apart. The two paths keep unrelated driver data on the device, so
+ * this deliberately does not look at drvdata: it is called from callbacks
+ * that run for either fusing.
+ */
+static bool wcd9378_is_sdca(struct device *dev)
+{
+	return device_property_read_bool(dev, "qcom,sdca-compliant");
+}
+
+#define WCD9378_SDW_CH(id, pn, cmask, mmask)	\
+	[id] = {				\
+		.port_num = pn,			\
+		.ch_mask = cmask,		\
+		.master_ch_mask = mmask,	\
+	}
+
+/*
+ * Each ADC sits alone on its own TX device port (channel 1); by default
+ * they land on channels 1/2/3 of the same master port. The DMIC and
+ * MBHC channels share device ports, so each picks its channel within
+ * the shared port.
+ */
+static const struct wcd_sdw_ch_info wcd9378_sdw_tx_ch_info[] = {
+	WCD9378_SDW_CH(WCD9378_ADC1, WCD9378_ADC_1_PORT, BIT(0), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_ADC2, WCD9378_ADC_2_PORT, BIT(0), BIT(1)),
+	WCD9378_SDW_CH(WCD9378_ADC3, WCD9378_ADC_3_PORT, BIT(0), BIT(2)),
+	WCD9378_SDW_CH(WCD9378_DMIC0, WCD9378_DMIC_0_1_MBHC_PORT, BIT(2), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_DMIC1, WCD9378_DMIC_0_1_MBHC_PORT, BIT(3), BIT(1)),
+	WCD9378_SDW_CH(WCD9378_MBHC, WCD9378_DMIC_0_1_MBHC_PORT, BIT(2), BIT(2)),
+	WCD9378_SDW_CH(WCD9378_DMIC2, WCD9378_DMIC_2_5_PORT, BIT(0), BIT(2)),
+	WCD9378_SDW_CH(WCD9378_DMIC3, WCD9378_DMIC_2_5_PORT, BIT(1), BIT(3)),
+	WCD9378_SDW_CH(WCD9378_DMIC4, WCD9378_DMIC_2_5_PORT, BIT(2), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_DMIC5, WCD9378_DMIC_2_5_PORT, BIT(3), BIT(1)),
+};
+
+static const struct wcd_sdw_ch_info wcd9378_sdw_rx_ch_info[] = {
+	WCD9378_SDW_CH(WCD9378_HPH_L, WCD9378_HPH_PORT, BIT(0), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_HPH_R, WCD9378_HPH_PORT, BIT(1), BIT(1)),
+	WCD9378_SDW_CH(WCD9378_CLSH, WCD9378_CLSH_PORT, BIT(0), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_COMP_L, WCD9378_COMP_PORT, BIT(0), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_COMP_R, WCD9378_COMP_PORT, BIT(1), BIT(1)),
+	WCD9378_SDW_CH(WCD9378_LO, WCD9378_LO_PORT, BIT(0), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_DSD_L, WCD9378_DSD_PORT, BIT(0), BIT(0)),
+	WCD9378_SDW_CH(WCD9378_DSD_R, WCD9378_DSD_PORT, BIT(1), BIT(1)),
+};
+
+static struct sdw_dpn_prop wcd9378_dpn_prop[WCD9378_MAX_SWR_PORTS] = {
+	{
+		.num = 1,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 8,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 2,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 3,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 4,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 5,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}
+};
+
+int wcd9378_sdw_hw_params(struct wcd9378_sdw_priv *wcd,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct snd_soc_dai *dai)
+{
+	struct sdw_port_config port_config[WCD9378_MAX_SWR_PORTS];
+	unsigned long ch_mask;
+	int i, j;
+
+	wcd->sconfig.ch_count = 1;
+	wcd->active_ports = 0;
+	for (i = 0; i < WCD9378_MAX_SWR_PORTS; i++) {
+		ch_mask = wcd->port_config[i].ch_mask;
+		if (!ch_mask)
+			continue;
+
+		for_each_set_bit(j, &ch_mask, 4)
+			wcd->sconfig.ch_count++;
+
+		port_config[wcd->active_ports] = wcd->port_config[i];
+		wcd->active_ports++;
+	}
+
+	wcd->sconfig.bps = 1;
+	wcd->sconfig.frame_rate = params_rate(params);
+	wcd->sconfig.direction = wcd->is_tx ? SDW_DATA_DIR_TX : SDW_DATA_DIR_RX;
+	wcd->sconfig.type = SDW_STREAM_PCM;
+
+	return sdw_stream_add_slave(wcd->sdev, &wcd->sconfig,
+				    &port_config[0], wcd->active_ports,
+				    wcd->sruntime);
+}
+
+/*
+ * The slave ops are per driver rather than per device, so each callback
+ * below dispatches on the fusing. The SDCA path only needs .read_prop;
+ * for the rest it behaves as it did when it had no callback at all,
+ * which the bus core treats the same as a callback returning 0.
+ */
+static int wcd9378_read_prop(struct sdw_slave *slave)
+{
+	if (wcd9378_is_sdca(&slave->dev))
+		return wcd9378_sdca_read_prop(slave);
+
+	/* The non-SDCA path sets its properties from probe(). */
+	return 0;
+}
+
+static int wcd9378_update_status(struct sdw_slave *slave,
+				 enum sdw_slave_status status)
+{
+	if (wcd9378_is_sdca(&slave->dev))
+		return 0;
+
+	return wcd_update_status(slave, status);
+}
+
+/*
+ * Handle a SoundWire out-of-band interrupt event by triggering the
+ * first irq of the slave_irq domain, which is then handled by the
+ * regmap_irq threaded irq.
+ */
+static int wcd9378_interrupt_callback(struct sdw_slave *slave,
+				      struct sdw_slave_intr_status *status)
+{
+	struct wcd9378_sdw_priv *wcd;
+
+	if (wcd9378_is_sdca(&slave->dev))
+		return 0;
+
+	wcd = dev_get_drvdata(&slave->dev);
+
+	return wcd_interrupt_callback(slave, wcd->slave_irq,
+				      WCD9378_SWRS_SCP_SDCA_INTSTAT_1,
+				      WCD9378_SWRS_SCP_SDCA_INTSTAT_2,
+				      WCD9378_SWRS_SCP_SDCA_INTSTAT_3);
+}
+
+static int wcd9378_bus_config(struct sdw_slave *slave,
+			      struct sdw_bus_params *params)
+{
+	if (wcd9378_is_sdca(&slave->dev))
+		return 0;
+
+	return wcd_bus_config(slave, params);
+}
+
+static const struct sdw_slave_ops wcd9378_slave_ops = {
+	.read_prop = wcd9378_read_prop,
+	.update_status = wcd9378_update_status,
+	.interrupt_callback = wcd9378_interrupt_callback,
+	.bus_config = wcd9378_bus_config,
 };
 
-static const struct sdw_slave_ops wcd9378_sdw_ops = {
-	.read_prop = wcd9378_sdca_read_prop,
+static const struct reg_default wcd9378_defaults[] = {
+	{ WCD9378_ANA_BIAS,			0x00 },
+	{ WCD9378_ANA_TX_CH1,			0x20 },
+	{ WCD9378_ANA_TX_CH2,			0x00 },
+	{ WCD9378_ANA_TX_CH3,			0x20 },
+	{ WCD9378_ANA_TX_CH3_HPF,		0x00 },
+	{ WCD9378_ANA_MICB2_RAMP,		0x00 },
+	{ WCD9378_BIAS_VBG_FINE_ADJ,		0x55 },
+	{ WCD9378_MBHC_CTL_SPARE_1,		0x02 },
+	{ WCD9378_MICB1_TEST_CTL_2,		0x00 },
+	{ WCD9378_MICB2_TEST_CTL_2,		0x00 },
+	{ WCD9378_MICB3_TEST_CTL_2,		0x80 },
+	{ WCD9378_TX_COM_TXFE_DIV_CTL,		0x22 },
+	{ WCD9378_SLEEP_CTL,			0x16 },
+	{ WCD9378_TX_NEW_CH12_MUX,		0x11 },
+	{ WCD9378_TX_NEW_CH34_MUX,		0x23 },
+	{ WCD9378_TOP_CLK_CFG,			0x00 },
+	{ WCD9378_CDC_COMP_CTL_0,		0x00 },
+	{ WCD9378_CDC_ANA_TX_CLK_CTL,		0x0e },
+	{ WCD9378_CDC_AMIC_CTL,			0x07 },
+	{ WCD9378_PDM_WD_CTL0,			0x0f },
+	{ WCD9378_PDM_WD_CTL1,			0x0f },
+	{ WCD9378_PLATFORM_CTL,			0x01 },
+	{ WCD9378_SYS_USAGE_CTRL,		0x00 },
+	{ WCD9378_HPH_UP_T0,			0x02 },
+	{ WCD9378_HPH_UP_T9,			0x02 },
+	{ WCD9378_HPH_DN_T0,			0x05 },
+	{ WCD9378_MICB_REMAP_TABLE_VAL_3,	0x00 },
+	{ WCD9378_MICB_REMAP_TABLE_VAL_4,	0x00 },
+	{ WCD9378_MICB_REMAP_TABLE_VAL_5,	0x00 },
+	{ WCD9378_SM0_MB_SEL,			0x00 },
+	{ WCD9378_SM1_MB_SEL,			0x00 },
+	{ WCD9378_SM2_MB_SEL,			0x00 },
+	{ WCD9378_MB_PULLUP_EN,			0x00 },
+	{ WCD9378_SMP_AMP_FUNC_ACT,		0x00 },
+	{ WCD9378_CMT_GRP_MASK,			0x00 },
+	{ WCD9378_SMP_JACK_IT31_MICB,		0x00 },
+	{ WCD9378_SMP_JACK_IT31_USAGE,		0x03 },
+	{ WCD9378_SMP_JACK_PDE34_REQ_PS,	0x03 },
+	{ WCD9378_SMP_JACK_FUNC_ACT,		0x00 },
+	{ WCD9378_SMP_MIC_IT11_MICB(0),		0x00 },
+	{ WCD9378_SMP_MIC_IT11_USAGE(0),	0x03 },
+	{ WCD9378_SMP_MIC_PDE11_REQ_PS(0),	0x03 },
+	{ WCD9378_SMP_MIC_FUNC_ACT(0),		0x00 },
+	{ WCD9378_SMP_MIC_IT11_MICB(1),		0x00 },
+	{ WCD9378_SMP_MIC_IT11_USAGE(1),	0x03 },
+	{ WCD9378_SMP_MIC_PDE11_REQ_PS(1),	0x03 },
+	{ WCD9378_SMP_MIC_FUNC_ACT(1),		0x00 },
+	{ WCD9378_SMP_MIC_IT11_MICB(2),		0x00 },
+	{ WCD9378_SMP_MIC_IT11_USAGE(2),	0x03 },
+	{ WCD9378_SMP_MIC_PDE11_REQ_PS(2),	0x03 },
+	{ WCD9378_SMP_MIC_FUNC_ACT(2),		0x00 },
+	/* All SDCA interrupts are disabled out of reset; regmap-irq owns these */
+	{ WCD9378_SWRS_SCP_SDCA_INTMASK_1,	0x00 },
+	{ WCD9378_SWRS_SCP_SDCA_INTMASK_2,	0x00 },
+	{ WCD9378_SWRS_SCP_SDCA_INTMASK_3,	0x00 },
+	{ WCD9378_SWRS_SCP_SDCA_INTRTYPE_1,	0x00 },
+	{ WCD9378_SWRS_SCP_SDCA_INTRTYPE_2,	0x00 },
+	{ WCD9378_SWRS_SCP_SDCA_INTRTYPE_3,	0x00 },
+};
+
+static bool wcd9378_rdwr_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WCD9378_ANA_BIAS:
+	case WCD9378_ANA_RX_SUPPLIES:
+	case WCD9378_ANA_HPH:
+	case WCD9378_ANA_TX_CH1:
+	case WCD9378_ANA_TX_CH2:
+	case WCD9378_ANA_TX_CH3:
+	case WCD9378_ANA_TX_CH3_HPF:
+	case WCD9378_ANA_MICB2_RAMP:
+	case WCD9378_BIAS_VBG_FINE_ADJ:
+	case WCD9378_MBHC_CTL_SPARE_1:
+	case WCD9378_MICB1_TEST_CTL_2:
+	case WCD9378_MICB2_TEST_CTL_2:
+	case WCD9378_MICB3_TEST_CTL_2:
+	case WCD9378_TX_COM_TXFE_DIV_CTL:
+	case WCD9378_CLASSH_MODE_2:
+	case WCD9378_CLASSH_MODE_3:
+	case WCD9378_FLYBACK_VNEG_CTRL_1:
+	case WCD9378_FLYBACK_VNEG_CTRL_4:
+	case WCD9378_FLYBACK_VNEGDAC_CTRL_2:
+	case WCD9378_RX_BIAS_HPH_LOWPOWER:
+	case WCD9378_RX_BIAS_FLYB_BUFF:
+	case WCD9378_HPH_PA_CTL1:
+	case WCD9378_SLEEP_CTL:
+	case WCD9378_TX_NEW_CH12_MUX:
+	case WCD9378_TX_NEW_CH34_MUX:
+	case WCD9378_HPH_RDAC_GAIN_CTL:
+	case WCD9378_HPH_RDAC_HD2_CTL_L:
+	case WCD9378_HPH_RDAC_HD2_CTL_R:
+	case WCD9378_HPH_NEW_INT_PA_MISC2:
+	case WCD9378_HPH_RDAC_TIMER1:
+	case WCD9378_HPH_RDAC_CLK_CTL1:
+	case WCD9378_CP_CP_DTOP_CTRL_14:
+	case WCD9378_CDC_HPH_GAIN_CTL:
+	case WCD9378_TOP_CLK_CFG:
+	case WCD9378_CDC_COMP_CTL_0:
+	case WCD9378_CDC_ANA_TX_CLK_CTL:
+	case WCD9378_CDC_AMIC_CTL:
+	case WCD9378_PDM_WD_CTL0:
+	case WCD9378_PDM_WD_CTL1:
+	case WCD9378_PLATFORM_CTL:
+	case WCD9378_SYS_USAGE_CTRL:
+	case WCD9378_FU42_MUTE_CH1_CN:
+	case WCD9378_FU42_MUTE_CH2_CN:
+	case WCD9378_FU42_CH_VOL_CH1_MSB:
+	case WCD9378_FU42_CH_VOL_CH1_LSB:
+	case WCD9378_FU42_CH_VOL_CH2_MSB:
+	case WCD9378_FU42_CH_VOL_CH2_LSB:
+	case WCD9378_HPH_UP_T0:
+	case WCD9378_HPH_UP_T7:
+	case WCD9378_HPH_UP_T9:
+	case WCD9378_HPH_DN_T0:
+	case WCD9378_HPH_DN_T1:
+	case WCD9378_MICB_REMAP_TABLE_VAL_3:
+	case WCD9378_MICB_REMAP_TABLE_VAL_4:
+	case WCD9378_MICB_REMAP_TABLE_VAL_5:
+	case WCD9378_SM0_MB_SEL:
+	case WCD9378_SM1_MB_SEL:
+	case WCD9378_SM2_MB_SEL:
+	case WCD9378_MB_PULLUP_EN:
+	case WCD9378_SMP_AMP_FUNC_STAT:
+	case WCD9378_SMP_AMP_FUNC_ACT:
+	case WCD9378_CMT_GRP_MASK:
+	case WCD9378_SMP_JACK_IT31_MICB:
+	case WCD9378_SMP_JACK_IT31_USAGE:
+	case WCD9378_SMP_JACK_PDE34_REQ_PS:
+	case WCD9378_SMP_JACK_FUNC_STAT:
+	case WCD9378_SMP_JACK_FUNC_ACT:
+	case WCD9378_IT41_USAGE:
+	case WCD9378_PDE47_REQ_PS:
+	case WCD9378_FU42_MUTE_CH1:
+	case WCD9378_FU42_MUTE_CH2:
+	case WCD9378_SMP_MIC_IT11_MICB(0):
+	case WCD9378_SMP_MIC_IT11_USAGE(0):
+	case WCD9378_SMP_MIC_PDE11_REQ_PS(0):
+	case WCD9378_SMP_MIC_FUNC_STAT(0):
+	case WCD9378_SMP_MIC_FUNC_ACT(0):
+	case WCD9378_SMP_MIC_IT11_MICB(1):
+	case WCD9378_SMP_MIC_IT11_USAGE(1):
+	case WCD9378_SMP_MIC_PDE11_REQ_PS(1):
+	case WCD9378_SMP_MIC_FUNC_STAT(1):
+	case WCD9378_SMP_MIC_FUNC_ACT(1):
+	case WCD9378_SMP_MIC_IT11_MICB(2):
+	case WCD9378_SMP_MIC_IT11_USAGE(2):
+	case WCD9378_SMP_MIC_PDE11_REQ_PS(2):
+	case WCD9378_SMP_MIC_FUNC_STAT(2):
+	case WCD9378_SMP_MIC_FUNC_ACT(2):
+	case WCD9378_SWRS_SCP_SDCA_INTMASK_1:
+	case WCD9378_SWRS_SCP_SDCA_INTMASK_2:
+	case WCD9378_SWRS_SCP_SDCA_INTMASK_3:
+	case WCD9378_SWRS_SCP_SDCA_INTSTAT_1:
+	case WCD9378_SWRS_SCP_SDCA_INTSTAT_2:
+	case WCD9378_SWRS_SCP_SDCA_INTSTAT_3:
+	case WCD9378_SWRS_SCP_SDCA_INTRTYPE_1:
+	case WCD9378_SWRS_SCP_SDCA_INTRTYPE_2:
+	case WCD9378_SWRS_SCP_SDCA_INTRTYPE_3:
+		return true;
+	}
+
+	return false;
+}
+
+static bool wcd9378_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WCD9378_FUNC_EXT_ID_0:
+	case WCD9378_FUNC_EXT_ID_1:
+	case WCD9378_FUNC_EXT_VER:
+	case WCD9378_FUNC_STAT:
+	case WCD9378_DEV_MANU_ID_0:
+	case WCD9378_DEV_MANU_ID_1:
+	case WCD9378_DEV_PART_ID_0:
+	case WCD9378_DEV_PART_ID_1:
+	case WCD9378_DEV_VER:
+	case WCD9378_EFUSE_REG_16:
+	case WCD9378_EFUSE_REG_29:
+	case WCD9378_SEQ_TX0_STAT:
+	case WCD9378_SEQ_TX1_STAT:
+	case WCD9378_SEQ_TX2_STAT:
+	case WCD9378_SMP_AMP_FUNC_STAT:
+	case WCD9378_SMP_JACK_FUNC_STAT:
+	case WCD9378_SMP_JACK_PDE34_ACT_PS:
+	case WCD9378_PDE47_ACT_PS:
+	case WCD9378_SMP_MIC_FUNC_STAT(0):
+	case WCD9378_SMP_MIC_FUNC_STAT(1):
+	case WCD9378_SMP_MIC_FUNC_STAT(2):
+	case WCD9378_SMP_MIC_OT10_USAGE(0):
+	case WCD9378_SMP_MIC_PDE11_ACT_PS(0):
+	case WCD9378_SMP_MIC_OT10_USAGE(1):
+	case WCD9378_SMP_MIC_PDE11_ACT_PS(1):
+	case WCD9378_SMP_MIC_OT10_USAGE(2):
+	case WCD9378_SMP_MIC_PDE11_ACT_PS(2):
+	/* RW1C -- writing 1 clears the pending bit */
+	case WCD9378_SWRS_SCP_SDCA_INTSTAT_1:
+	case WCD9378_SWRS_SCP_SDCA_INTSTAT_2:
+	case WCD9378_SWRS_SCP_SDCA_INTSTAT_3:
+		return true;
+	}
+
+	return false;
+}
+
+static bool wcd9378_readable_register(struct device *dev, unsigned int reg)
+{
+	if (wcd9378_volatile_register(dev, reg))
+		return true;
+
+	return wcd9378_rdwr_register(dev, reg);
+}
+
+static const struct regmap_config wcd9378_regmap_config = {
+	.name = "wcd9378_csr",
+	.reg_bits = 32,
+	.val_bits = 8,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = wcd9378_defaults,
+	.num_reg_defaults = ARRAY_SIZE(wcd9378_defaults),
+	.max_register = WCD9378_MAX_REGISTER,
+	.readable_reg = wcd9378_readable_register,
+	.writeable_reg = wcd9378_rdwr_register,
+	.volatile_reg = wcd9378_volatile_register,
 };
 
+static int wcd9378_sdw_probe(struct sdw_slave *pdev,
+			     const struct sdw_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd9378_sdw_priv *wcd;
+	unsigned int num_ports;
+	int ret;
+
+	/* An SDCA-compliant part is one slave and brings its own topology. */
+	if (wcd9378_is_sdca(dev))
+		return wcd9378_sdca_probe(pdev, id);
+
+	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
+	if (!wcd)
+		return -ENOMEM;
+
+	/*
+	 * Only the TX slave reaches the codec control register space, so it
+	 * is the one that references its RX peer and owns the codec.
+	 */
+	wcd->is_tx = of_property_present(dev->of_node, "qcom,rx-device");
+
+	if (wcd->is_tx)
+		num_ports = WCD9378_MAX_TX_SWR_PORTS;
+	else
+		num_ports = WCD9378_MAX_SWR_PORTS;
+
+	/* Port map index starts at 0, however the data ports start at index 1 */
+	ret = of_property_read_u32_array(dev->of_node, "qcom,port-mapping",
+					 &pdev->m_port_map[1], num_ports);
+	if (ret < 0)
+		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
+			 wcd->is_tx ? "TX" : "RX", ret);
+
+	wcd->sdev = pdev;
+	dev_set_drvdata(dev, wcd);
+
+	/*
+	 * SDW_SCP_INT1_IMPL_DEF is the only route by which the bus core
+	 * notifies this driver: the part enumerates with class_id 0, so the
+	 * core never reads SDW_DP0_INT and the SDCA cascade is invisible to
+	 * it. Without IMPL_DEF the SDCA interrupt status is never cleared and
+	 * the slave re-asserts Alert forever.
+	 */
+	pdev->prop.scp_int1_mask = SDW_SCP_INT1_IMPL_DEF |
+				   SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	pdev->prop.lane_control_support = true;
+	pdev->prop.simple_clk_stop_capable = true;
+	/* The SDCA control space sits above the 16-bit address range */
+	pdev->prop.paging_support = true;
+	/*
+	 * WCD9378 enumerates with SoundWire class_id 0 (non-SDCA ID) even though
+	 * it uses SDCA control. The core only programs SDW_SCP_BUS_CLOCK_BASE /
+	 * SDW_SCP_BUSCLOCK_SCALE when (class_id != 0 || clock_reg_supported).
+	 * Without this the slave's clock base/scale is never programmed, the
+	 * slave desyncs from the v2.x master, and the master raises a continuous
+	 * MASTER_CLASH_DET storm on the control channel. Declare clock-register
+	 * support so the core programs base/scale (needs bus prop.mclk_freq set).
+	 */
+	pdev->prop.clock_reg_supported = true;
+
+	if (wcd->is_tx) {
+		pdev->prop.source_ports = GENMASK(WCD9378_MAX_TX_SWR_PORTS, 1);
+		pdev->prop.src_dpn_prop = wcd9378_dpn_prop;
+		wcd->ch_info = wcd9378_sdw_tx_ch_info;
+		pdev->prop.wake_capable = true;
+
+		wcd->regmap = devm_regmap_init_sdw(pdev, &wcd9378_regmap_config);
+		if (IS_ERR(wcd->regmap))
+			return dev_err_probe(dev, PTR_ERR(wcd->regmap),
+					     "Regmap init failed\n");
+
+		/* Start in cache-only until device is enumerated */
+		regcache_cache_only(wcd->regmap, true);
+	} else {
+		pdev->prop.sink_ports = GENMASK(WCD9378_MAX_SWR_PORTS, 1);
+		pdev->prop.sink_dpn_prop = wcd9378_dpn_prop;
+		wcd->ch_info = wcd9378_sdw_rx_ch_info;
+	}
+
+	/*
+	 * The codec has no top-level device of its own: the TX slave owns
+	 * the codec resources and aggregates the RX slave, which joins as
+	 * a plain component.
+	 */
+	if (wcd->is_tx)
+		return wcd9378_tx_master_probe(dev, wcd);
+
+	return component_add(dev, &wcd_sdw_component_ops);
+}
+
+static void wcd9378_sdw_remove(struct sdw_slave *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd9378_sdw_priv *wcd;
+
+	if (wcd9378_is_sdca(dev)) {
+		wcd9378_sdca_remove(pdev);
+		return;
+	}
+
+	wcd = dev_get_drvdata(dev);
+
+	if (wcd->is_tx) {
+		wcd9378_tx_master_remove(dev);
+		return;
+	}
+
+	/*
+	 * Runtime PM for the RX slave is enabled in wcd-common's component
+	 * bind and disabled in its unbind, which this component_del()
+	 * triggers when the aggregate device tears down.
+	 */
+	component_del(dev, &wcd_sdw_component_ops);
+}
+
 static const struct sdw_device_id wcd9378_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
-	{ }
+	{ },
 };
 MODULE_DEVICE_TABLE(sdw, wcd9378_sdw_id);
 
+static int wcd9378_runtime_suspend(struct device *dev)
+{
+	struct wcd9378_sdw_priv *wcd;
+
+	if (wcd9378_is_sdca(dev))
+		return wcd9378_sdca_runtime_suspend(dev);
+
+	wcd = dev_get_drvdata(dev);
+
+	if (wcd->regmap) {
+		regcache_cache_only(wcd->regmap, true);
+		regcache_mark_dirty(wcd->regmap);
+	}
+
+	return 0;
+}
+
+static int wcd9378_runtime_resume(struct device *dev)
+{
+	struct wcd9378_sdw_priv *wcd;
+
+	if (wcd9378_is_sdca(dev))
+		return wcd9378_sdca_runtime_resume(dev);
+
+	wcd = dev_get_drvdata(dev);
+
+	if (wcd->regmap) {
+		regcache_cache_only(wcd->regmap, false);
+		regcache_sync(wcd->regmap);
+	}
+
+	return 0;
+}
+
+/*
+ * The non-SDCA path has nothing to do across a system sleep: the TX
+ * slave is held runtime-active for the lifetime of the component and
+ * the register cache is restored by the bus core re-enumerating the
+ * slave, so these are no-ops for it.
+ */
+static int wcd9378_system_suspend(struct device *dev)
+{
+	if (wcd9378_is_sdca(dev))
+		return wcd9378_sdca_system_suspend(dev);
+
+	return 0;
+}
+
+static int wcd9378_system_resume(struct device *dev)
+{
+	if (wcd9378_is_sdca(dev))
+		return wcd9378_sdca_system_resume(dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wcd9378_sdw_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(wcd9378_system_suspend, wcd9378_system_resume)
+	RUNTIME_PM_OPS(wcd9378_runtime_suspend, wcd9378_runtime_resume, NULL)
+};
+
 static struct sdw_driver wcd9378_sdw_driver = {
+	.probe = wcd9378_sdw_probe,
+	.remove = wcd9378_sdw_remove,
+	.ops = &wcd9378_slave_ops,
+	.id_table = wcd9378_sdw_id,
 	.driver = {
-		.name	= "wcd9378",
-		.pm	= pm_ptr(&wcd9378_sdw_pm_ops),
-	},
-	.probe		= wcd9378_sdca_probe,
-	.remove		= wcd9378_sdca_remove,
-	.id_table	= wcd9378_sdw_id,
-	.ops		= &wcd9378_sdw_ops,
+		.name = "wcd9378",
+		.pm = pm_ptr(&wcd9378_sdw_pm_ops),
+	}
 };
 module_sdw_driver(wcd9378_sdw_driver);
 
 MODULE_DESCRIPTION("Qualcomm WCD9378 (Tambora) SoundWire codec");
 MODULE_AUTHOR("Qualcomm Technologies, Inc.");
-MODULE_LICENSE("Dual BSD/GPL");
+MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_SDCA");
 MODULE_IMPORT_NS("SND_SOC_SDCA_CLASS");
diff --git a/sound/soc/codecs/wcd9378.c b/sound/soc/codecs/wcd9378.c
new file mode 100644
index 000000000000..8a771a027127
--- /dev/null
+++ b/sound/soc/codecs/wcd9378.c
@@ -0,0 +1,2201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Jorijn van der Graaf
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ * Qualcomm WCD9378 audio codec driver.
+ *
+ * The WCD9378 pairs a WCD937x-compatible analog core with SDCA
+ * function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in
+ * sequencers perform the analog power-up/down autonomously: capture is
+ * started by programming the ADC usage mode (ITxx_USAGE), requesting
+ * power state 0 on the function's PDE, and letting the sequencer ramp
+ * the micbias selected through SMx_MB_SEL. The sequencers are a vendor
+ * layer behind the SDCA-shaped controls: a power-state request starts
+ * an autonomous multi-step analog program, rather than the plain byte
+ * accesses of generic SDCA.
+ *
+ * TX/capture and HPH (headphone) playback are implemented. EAR, AUX,
+ * DSD-bypass playback, MBHC and the SmartAMP function are not implemented.
+ */
+
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/sdca_function.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+
+#include "wcd-clsh-v2.h"
+#include "wcd-common.h"
+#include "wcd9378.h"
+
+/* SoundWire SCP_COMMIT register value used to latch a bank switch */
+#define WCD9378_SDW_COMMIT_VALUE		0x02
+
+enum {
+	AIF1_PB = 0,
+	AIF1_CAP,
+	NUM_CODEC_DAIS,
+};
+
+enum {
+	MIC_BIAS_1 = 1,
+	MIC_BIAS_2,
+	MIC_BIAS_3,
+};
+
+enum {
+	MICB_PULLUP_ENABLE,
+	MICB_PULLUP_DISABLE,
+	MICB_ENABLE,
+	MICB_DISABLE,
+};
+
+/*
+ * sys-usage capability bits. SYS_USAGE_CTRL is a vendor register in
+ * the sequencer block (not an SDCA control) selecting one of 13 canned
+ * "active entity set" profiles; these are the capabilities a profile
+ * can advertise, and wcd9378_sys_usage_profiles[] below maps each
+ * profile to the set it provides.
+ */
+enum {
+	WCD9378_SYS_USAGE_CLASS_AB = 0,
+	WCD9378_SYS_USAGE_TX1_FOR_JACK,
+	WCD9378_SYS_USAGE_TX2_AMIC4,
+	WCD9378_SYS_USAGE_TX2_AMIC1,
+	WCD9378_SYS_USAGE_TX1_AMIC3,
+	WCD9378_SYS_USAGE_TX1_AMIC2,
+	WCD9378_SYS_USAGE_TX0_AMIC2,
+	WCD9378_SYS_USAGE_TX0_AMIC1,
+	WCD9378_SYS_USAGE_RX2_EAR,
+	WCD9378_SYS_USAGE_RX2_AUX,
+	WCD9378_SYS_USAGE_RX1_AUX,
+	WCD9378_SYS_USAGE_RX0_EAR,
+	WCD9378_SYS_USAGE_RX0_RX1_HPH,
+};
+
+/* Capability sets of the 13 canned SYS_USAGE_CTRL profiles */
+static const unsigned int wcd9378_sys_usage_profiles[] = {
+	0x0c95, 0x12a7, 0x0c99, 0x1aab, 0x0894, 0x11a6, 0x0898,
+	0x11ab, 0x126a, 0x116b, 0x1ca7, 0x1195, 0x1296,
+};
+
+struct wcd9378_priv {
+	struct sdw_slave *tx_sdw_dev;
+	struct wcd9378_sdw_priv *sdw_priv[NUM_CODEC_DAIS];
+	struct device *txdev;
+	struct device *rxdev;
+	struct device_node *rxnode;
+	struct regmap *regmap;
+	struct wcd_common common;
+	/* micbias refcount lock */
+	struct mutex micb_lock;
+	u8 micb_usage_val[WCD9378_MAX_MICBIAS];
+	int micb_ref[WCD9378_MAX_MICBIAS];
+	int pullup_ref[WCD9378_MAX_MICBIAS];
+	unsigned long sys_usage_mask;
+	/* serializes sys_usage_mask updates across TX and HPH DAPM paths */
+	struct mutex sys_usage_lock;
+	/* per-ADC profile bit and target function, latched at power-up */
+	int tx_sys_bit[3];
+	bool tx_is_jack[3];
+	u32 tx_mode[3];
+	struct gpio_desc *reset_gpio;
+
+	u32 hph_mode;
+	unsigned long status_mask;
+	/* HPHL/HPHR compander (DRE), set from the HPH{L,R}_COMP switches */
+	bool comp1_enable;
+	bool comp2_enable;
+	/* HPHL/HPHR channel volume, in WCD9378_HPH_VOL_STEP steps */
+	u8 hph_vol[2];
+	atomic_t rx_clk_cnt;
+	int hphl_pdm_wd_int;
+	int hphr_pdm_wd_int;
+	struct irq_domain *virq;
+	const struct regmap_irq_chip *chip_desc;
+	struct regmap_irq_chip_data *irq_chip;
+};
+
+enum {
+	HPH_COMP_DELAY,
+	HPH_PA_DELAY,
+	HPH_SEQ_TX_PM,
+};
+
+static const char * const wcd9378_supplies[] = {
+	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias",
+};
+
+/* SDCA function block registers driving one ADC */
+struct wcd9378_smp_fn {
+	u32 usage_reg;
+	u32 micb_reg;
+	u32 req_reg;
+	u32 act_reg;
+	u32 hpf_reg;
+	u8 hpf_mask;
+};
+
+/* ADC1/2/3 through SmartMIC0/1/2 */
+static const struct wcd9378_smp_fn wcd9378_smp_mic[] = {
+	{
+		.usage_reg = WCD9378_SMP_MIC_IT11_USAGE(0),
+		.micb_reg = WCD9378_SMP_MIC_IT11_MICB(0),
+		.req_reg = WCD9378_SMP_MIC_PDE11_REQ_PS(0),
+		.act_reg = WCD9378_SMP_MIC_PDE11_ACT_PS(0),
+		.hpf_reg = WCD9378_ANA_TX_CH2,
+		.hpf_mask = WCD9378_ANA_TX_CH2_HPF1_INIT,
+	}, {
+		.usage_reg = WCD9378_SMP_MIC_IT11_USAGE(1),
+		.micb_reg = WCD9378_SMP_MIC_IT11_MICB(1),
+		.req_reg = WCD9378_SMP_MIC_PDE11_REQ_PS(1),
+		.act_reg = WCD9378_SMP_MIC_PDE11_ACT_PS(1),
+		.hpf_reg = WCD9378_ANA_TX_CH2,
+		.hpf_mask = WCD9378_ANA_TX_CH2_HPF2_INIT,
+	}, {
+		.usage_reg = WCD9378_SMP_MIC_IT11_USAGE(2),
+		.micb_reg = WCD9378_SMP_MIC_IT11_MICB(2),
+		.req_reg = WCD9378_SMP_MIC_PDE11_REQ_PS(2),
+		.act_reg = WCD9378_SMP_MIC_PDE11_ACT_PS(2),
+		.hpf_reg = WCD9378_ANA_TX_CH3_HPF,
+		.hpf_mask = WCD9378_ANA_TX_CH3_HPF3_INIT,
+	},
+};
+
+/* ADC2 fed from AMIC2 runs through the SmartJACK function instead */
+static const struct wcd9378_smp_fn wcd9378_smp_jack_adc2 = {
+	.usage_reg = WCD9378_SMP_JACK_IT31_USAGE,
+	.micb_reg = WCD9378_SMP_JACK_IT31_MICB,
+	.req_reg = WCD9378_SMP_JACK_PDE34_REQ_PS,
+	.act_reg = WCD9378_SMP_JACK_PDE34_ACT_PS,
+};
+
+/*
+ * Measured acoustically: the TX gain field steps 1.5 dB per code
+ * (+6 dB per 4 codes, +30 dB over the full 0..20 range), as does
+ * mainline wcd938x; the wcd937x and wcd939x drivers claim 0.25 dB
+ * steps for the same field.
+ */
+static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 150, 0);
+static const DECLARE_TLV_DB_SCALE(hph_gain, -3000, 150, 0);
+
+static void wcd9378_reset(struct wcd9378_priv *wcd9378)
+{
+	gpiod_set_value(wcd9378->reset_gpio, 1);
+	usleep_range(20, 30);
+	gpiod_set_value(wcd9378->reset_gpio, 0);
+	usleep_range(20, 30);
+}
+
+/*
+ * The ASoC component and the DAIs live on the TX SoundWire device, whose
+ * driver data is the TX wcd9378_sdw_priv; the codec-wide state hangs off
+ * that.
+ */
+static struct wcd9378_priv *wcd9378_dev_priv(struct device *dev)
+{
+	struct wcd9378_sdw_priv *wcd = dev_get_drvdata(dev);
+
+	return wcd->wcd9378;
+}
+
+/*
+ * Activate the SDCA function classes. Without FUNC_ACT the sequencer
+ * ignores all PDE power-state requests.
+ */
+static void wcd9378_class_load(struct snd_soc_component *component)
+{
+	int i;
+
+	/*
+	 * Plain writes, not update_bits, so the 0->1 activation edge
+	 * always reaches the hardware regardless of regcache state.
+	 * The engine boots from this edge only on a freshly reset
+	 * codec; once it dies (bus clock-stop) no register write
+	 * revives it, see the TX bus PM hold in wcd9378_bind().
+	 */
+	/* SmartAMP: activation edge, class-load delay, clear the stickies */
+	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_ACT, 0x00);
+	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_ACT, 0x01);
+	usleep_range(20000, 20010);
+	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_STAT,
+				WCD9378_FUNC_STAT_STICKY_MASK);
+
+	/*
+	 * SmartJACK: same steps, plus the commit-group assignment that
+	 * class load requires.
+	 */
+	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_ACT, 0x00);
+	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_ACT, 0x01);
+	usleep_range(30000, 30010);
+	snd_soc_component_update_bits(component, WCD9378_CMT_GRP_MASK,
+				      0xff, 0x02);
+	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_STAT,
+				WCD9378_FUNC_STAT_STICKY_MASK);
+
+	/* SmartMIC0/1/2: same steps per mic function */
+	for (i = 0; i < 3; i++) {
+		snd_soc_component_write(component,
+					WCD9378_SMP_MIC_FUNC_ACT(i), 0x00);
+		snd_soc_component_write(component,
+					WCD9378_SMP_MIC_FUNC_ACT(i), 0x01);
+		usleep_range(5000, 5010);
+		snd_soc_component_write(component,
+					WCD9378_SMP_MIC_FUNC_STAT(i),
+					WCD9378_FUNC_STAT_STICKY_MASK);
+	}
+}
+
+static void wcd9378_io_init(struct snd_soc_component *component)
+{
+	u32 efuse;
+
+	/* Bandgap and analog master bias, with precharge pulse */
+	efuse = snd_soc_component_read(component, WCD9378_EFUSE_REG_16);
+	snd_soc_component_update_bits(component, WCD9378_MBHC_CTL_SPARE_1,
+				      0x03, efuse == 0 ? 0x03 : 0x01);
+
+	snd_soc_component_update_bits(component, WCD9378_SLEEP_CTL,
+				      WCD9378_SLEEP_CTL_BG_CTL_MASK, 0x0e);
+	snd_soc_component_update_bits(component, WCD9378_SLEEP_CTL,
+				      WCD9378_SLEEP_CTL_BG_EN,
+				      WCD9378_SLEEP_CTL_BG_EN);
+	usleep_range(1000, 1010);
+	snd_soc_component_update_bits(component, WCD9378_SLEEP_CTL,
+				      WCD9378_SLEEP_CTL_LDOL_BG_SEL,
+				      WCD9378_SLEEP_CTL_LDOL_BG_SEL);
+	usleep_range(1000, 1010);
+	snd_soc_component_update_bits(component, WCD9378_BIAS_VBG_FINE_ADJ,
+				      0xf0, 0xb0);
+	snd_soc_component_update_bits(component, WCD9378_ANA_BIAS,
+				      WCD9378_ANA_BIAS_ANALOG_BIAS_EN,
+				      WCD9378_ANA_BIAS_ANALOG_BIAS_EN);
+	snd_soc_component_update_bits(component, WCD9378_ANA_BIAS,
+				      WCD9378_ANA_BIAS_PRECHRG_EN,
+				      WCD9378_ANA_BIAS_PRECHRG_EN);
+	usleep_range(10000, 10010);
+	snd_soc_component_update_bits(component, WCD9378_ANA_BIAS,
+				      WCD9378_ANA_BIAS_PRECHRG_EN, 0x00);
+
+	/* TX supporting clocks/dividers */
+	snd_soc_component_update_bits(component, WCD9378_CDC_ANA_TX_CLK_CTL,
+				      WCD9378_CDC_ANA_TXSCBIAS_CLK_EN,
+				      WCD9378_CDC_ANA_TXSCBIAS_CLK_EN);
+	snd_soc_component_update_bits(component, WCD9378_TX_COM_TXFE_DIV_CTL,
+				      WCD9378_TX_COM_TXFE_DIV_SEQ_BYPASS,
+				      WCD9378_TX_COM_TXFE_DIV_SEQ_BYPASS);
+	snd_soc_component_update_bits(component, WCD9378_PDM_WD_CTL0,
+				      0x18, 0x10);
+	snd_soc_component_update_bits(component, WCD9378_PDM_WD_CTL1,
+				      0x18, 0x10);
+
+	/* Micbias LDO driver bias */
+	snd_soc_component_update_bits(component, WCD9378_MICB1_TEST_CTL_2,
+				      0x07, 0x01);
+	snd_soc_component_update_bits(component, WCD9378_MICB2_TEST_CTL_2,
+				      0x07, 0x01);
+	snd_soc_component_update_bits(component, WCD9378_MICB3_TEST_CTL_2,
+				      0x07, 0x01);
+
+	/* HPH RDAC/gain defaults and power sequencer timing */
+	snd_soc_component_update_bits(component, WCD9378_HPH_RDAC_HD2_CTL_L,
+				      0x0f, 0x04);
+	snd_soc_component_update_bits(component, WCD9378_HPH_RDAC_HD2_CTL_R,
+				      0x0f, 0x04);
+	snd_soc_component_update_bits(component, WCD9378_HPH_RDAC_GAIN_CTL,
+				      0xf0, 0x50);
+	snd_soc_component_update_bits(component, WCD9378_HPH_UP_T0,
+				      0x07, 0x05);
+	snd_soc_component_update_bits(component, WCD9378_HPH_UP_T9,
+				      0x07, 0x05);
+	snd_soc_component_update_bits(component, WCD9378_HPH_DN_T0,
+				      0x07, 0x06);
+
+	/* SmartMIC function N powers the micbias SMx_MB_SEL points at */
+	snd_soc_component_update_bits(component, WCD9378_SM0_MB_SEL,
+				      WCD9378_SM_MB_SEL_MASK, 0x01);
+	snd_soc_component_update_bits(component, WCD9378_SM1_MB_SEL,
+				      WCD9378_SM_MB_SEL_MASK, 0x02);
+	snd_soc_component_update_bits(component, WCD9378_SM2_MB_SEL,
+				      WCD9378_SM_MB_SEL_MASK, 0x03);
+	/*
+	 * SYS_USAGE_CTRL is managed dynamically by wcd9378_sys_usage_update().
+	 * Do not reset it here -- writing 0x00 disables all sequencers and
+	 * resets TX0_STAT to 0x0 (uninitialized), breaking the TX sequencer.
+	 */
+	wcd9378_class_load(component);
+}
+
+/*
+ * Derive the sys-usage capability bit for an ADC from its input mux.
+ * Only combinations the canned profiles cover are usable.
+ */
+static int wcd9378_sys_usage_bit_get(struct snd_soc_component *component,
+				     int adc, bool *is_jack)
+{
+	u32 val;
+
+	*is_jack = false;
+
+	switch (adc) {
+	case 0:
+		val = snd_soc_component_read(component, WCD9378_TX_NEW_CH12_MUX) &
+			WCD9378_TX_NEW_CH12_MUX_CH1_SEL_MASK;
+		if (val == 0x01)
+			return WCD9378_SYS_USAGE_TX0_AMIC1;
+		if (val == 0x02)
+			return WCD9378_SYS_USAGE_TX0_AMIC2;
+		break;
+	case 1:
+		val = (snd_soc_component_read(component, WCD9378_TX_NEW_CH12_MUX) &
+			WCD9378_TX_NEW_CH12_MUX_CH2_SEL_MASK) >> 3;
+		if (val == 0x02) {
+			*is_jack = true;
+			return WCD9378_SYS_USAGE_TX1_AMIC2;
+		}
+		if (val == 0x03)
+			return WCD9378_SYS_USAGE_TX1_AMIC3;
+		break;
+	case 2:
+		val = snd_soc_component_read(component, WCD9378_TX_NEW_CH34_MUX) &
+			WCD9378_TX_NEW_CH34_MUX_CH3_SEL_MASK;
+		if (val == 0x01)
+			return WCD9378_SYS_USAGE_TX2_AMIC1;
+		if (val == 0x03)
+			return WCD9378_SYS_USAGE_TX2_AMIC4;
+		break;
+	}
+
+	dev_err(component->dev,
+		"ADC%d input mux selection not supported by any sys-usage profile\n",
+		adc + 1);
+	return -EINVAL;
+}
+
+static int wcd9378_sys_usage_update(struct snd_soc_component *component,
+				    int bit, bool enable)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	int i, ret = 0;
+
+	mutex_lock(&wcd9378->sys_usage_lock);
+
+	if (!enable) {
+		clear_bit(bit, &wcd9378->sys_usage_mask);
+		goto done;
+	}
+
+	set_bit(bit, &wcd9378->sys_usage_mask);
+
+	for (i = 0; i < ARRAY_SIZE(wcd9378_sys_usage_profiles); i++) {
+		if ((wcd9378_sys_usage_profiles[i] & wcd9378->sys_usage_mask) ==
+		    wcd9378->sys_usage_mask)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(wcd9378_sys_usage_profiles)) {
+		clear_bit(bit, &wcd9378->sys_usage_mask);
+		dev_err(component->dev,
+			"no sys-usage profile covers active paths (mask %#lx)\n",
+			wcd9378->sys_usage_mask);
+		ret = -EINVAL;
+		goto done;
+	}
+
+	snd_soc_component_update_bits(component, WCD9378_SYS_USAGE_CTRL,
+				      WCD9378_SYS_USAGE_CTRL_MASK, i);
+
+done:
+	mutex_unlock(&wcd9378->sys_usage_lock);
+	return ret;
+}
+
+static u32 wcd9378_get_mode_val(struct wcd9378_priv *wcd9378, int adc)
+{
+	switch (wcd9378->tx_mode[adc]) {
+	case 1:
+		return WCD9378_ADC_USAGE_HIFI;
+	case 2:
+		return WCD9378_ADC_USAGE_LO_HIF;
+	case 4:
+		return WCD9378_ADC_USAGE_LP;
+	case 0: /* ADC_INVALID (unset) */
+	case 3:
+	default:
+		return WCD9378_ADC_USAGE_NORMAL;
+	}
+}
+
+/* Actual bus clock is half the SoundWire double-rate frequency */
+static unsigned int wcd9378_tx_bus_clk(struct wcd9378_priv *wcd9378)
+{
+	return wcd9378->tx_sdw_dev->bus->params.curr_dr_freq / 2;
+}
+
+static int wcd9378_tx_sequencer_enable(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol,
+				       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	const struct wcd9378_smp_fn *fn;
+	int adc = w->shift;
+	bool is_jack = false;
+	int sys_bit, retries;
+	u32 val;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		sys_bit = wcd9378_sys_usage_bit_get(component, adc, &is_jack);
+		if (sys_bit < 0)
+			return sys_bit;
+
+		/*
+		 * Latch the profile bit and the target function: the input
+		 * mux can be rewritten while the path is powered, and
+		 * power-down must tear down what was actually powered up.
+		 */
+		wcd9378->tx_sys_bit[adc] = sys_bit;
+		wcd9378->tx_is_jack[adc] = is_jack;
+		if (is_jack)
+			fn = &wcd9378_smp_jack_adc2;
+		else
+			fn = &wcd9378_smp_mic[adc];
+
+		if (wcd9378_sys_usage_update(component, sys_bit, true))
+			return -EINVAL;
+
+		/*
+		 * NORMAL/HIFI ADC modes need a 9.6 MHz bus clock; on a
+		 * 4.8 MHz bus only the LP mode is valid and anything else
+		 * makes the sequencer refuse to power up.
+		 */
+		if (wcd9378_tx_bus_clk(wcd9378) < 9600000)
+			val = WCD9378_ADC_USAGE_LP;
+		else
+			val = wcd9378_get_mode_val(wcd9378, adc);
+
+		snd_soc_component_update_bits(component, fn->usage_reg, 0xff, val);
+		if (fn->hpf_reg)
+			snd_soc_component_update_bits(component, fn->hpf_reg,
+						      fn->hpf_mask, fn->hpf_mask);
+
+		snd_soc_component_update_bits(component, fn->req_reg, 0xff,
+					      WCD9378_PDE_PS0_ON);
+		usleep_range(800, 810);
+
+		if (fn->hpf_reg)
+			snd_soc_component_update_bits(component, fn->hpf_reg,
+						      fn->hpf_mask, 0x00);
+
+		/* Wait for the sequencer to reach PS0 */
+		retries = 20;
+		do {
+			val = snd_soc_component_read(component, fn->act_reg);
+			if (val == WCD9378_PDE_PS0_ON)
+				break;
+			usleep_range(500, 510);
+		} while (--retries);
+		if (val != WCD9378_PDE_PS0_ON)
+			dev_warn(component->dev,
+				 "TX%d sequencer not in PS0 (act_ps %#x, bus %u Hz)\n",
+				 adc, val,
+				 wcd9378->tx_sdw_dev->bus->params.curr_dr_freq);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		sys_bit = wcd9378->tx_sys_bit[adc];
+		if (sys_bit < 0)
+			break;
+		if (wcd9378->tx_is_jack[adc])
+			fn = &wcd9378_smp_jack_adc2;
+		else
+			fn = &wcd9378_smp_mic[adc];
+
+		snd_soc_component_update_bits(component, fn->usage_reg, 0xff,
+					      WCD9378_ADC_USAGE_OFF);
+		if (fn->hpf_reg)
+			snd_soc_component_update_bits(component, fn->hpf_reg,
+						      fn->hpf_mask, 0x00);
+		snd_soc_component_update_bits(component, fn->req_reg, 0xff,
+					      WCD9378_PDE_PS3_OFF);
+		usleep_range(800, 810);
+		wcd9378_sys_usage_update(component, sys_bit, false);
+		wcd9378->tx_sys_bit[adc] = -1;
+		break;
+	}
+
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* HPH (headphone) playback path                                      */
+/* ------------------------------------------------------------------ */
+static u8 wcd9378_get_hph_pwr_level(int hph_mode)
+{
+	switch (hph_mode) {
+	case CLS_H_LOHIFI:
+	case CLS_AB_LOHIFI:
+		return 0x00;
+	case CLS_H_LP:
+	case CLS_AB_LP:
+		return 0x01;
+	case CLS_H_HIFI:
+	case CLS_AB_HIFI:
+		return 0x02;
+	case CLS_H_ULP:
+	case CLS_AB:
+	case CLS_H_NORMAL:
+	default:
+		return 0x03;
+	}
+}
+
+static int wcd9378_pde_act_ps_check(struct snd_soc_component *component,
+				    unsigned int reg, u8 expected_ps)
+{
+	int retries = 40;
+	unsigned int val = 0;
+
+	while (retries--) {
+		val = snd_soc_component_read(component, reg) & 0xff;
+		if (val == expected_ps)
+			return 0;
+
+		usleep_range(1000, 1100);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static void wcd9378_sdw_commit(struct snd_soc_component *component,
+			       struct wcd9378_priv *wcd9378)
+{
+	struct sdw_slave *rx_sdw = NULL;
+	int ret;
+
+	if (wcd9378->rxdev)
+		rx_sdw = dev_to_sdw_dev(wcd9378->rxdev);
+
+	if (!wcd9378->tx_sdw_dev && !rx_sdw)
+		return;
+
+	if (wcd9378->tx_sdw_dev) {
+		ret = sdw_write(wcd9378->tx_sdw_dev, SDW_SCP_COMMIT,
+				WCD9378_SDW_COMMIT_VALUE);
+		if (ret < 0)
+			dev_err_ratelimited(component->dev,
+					    "SDW commit (tx) failed: %d\n", ret);
+	}
+
+	if (rx_sdw) {
+		ret = sdw_write(rx_sdw, SDW_SCP_COMMIT, WCD9378_SDW_COMMIT_VALUE);
+		if (ret < 0)
+			dev_err_ratelimited(component->dev,
+					    "SDW commit (rx) failed: %d\n", ret);
+	}
+}
+
+static int wcd9378_rx_clk_enable(struct snd_soc_component *component)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+
+	if (atomic_read(&wcd9378->rx_clk_cnt))
+		return 0;
+
+	snd_soc_component_update_bits(component,
+				      WCD9378_ANA_RX_SUPPLIES, BIT(0), BIT(0));
+	atomic_inc(&wcd9378->rx_clk_cnt);
+
+	return 0;
+}
+
+static int wcd9378_rx_clk_disable(struct snd_soc_component *component)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+
+	if (!atomic_read(&wcd9378->rx_clk_cnt)) {
+		dev_err(component->dev, "clk already disabled\n");
+		return 0;
+	}
+
+	atomic_dec(&wcd9378->rx_clk_cnt);
+	snd_soc_component_update_bits(component,
+				      WCD9378_ANA_RX_SUPPLIES, BIT(0), 0x00);
+
+	return 0;
+}
+
+static void wcd9378_hph_write_volume(struct snd_soc_component *component,
+				     unsigned int msb_reg, unsigned int lsb_reg,
+				     int steps)
+{
+	u16 gain = (steps - WCD9378_HPH_VOL_STEPS) * WCD9378_HPH_VOL_STEP;
+
+	snd_soc_component_write(component, msb_reg, gain >> 8);
+	snd_soc_component_write(component, lsb_reg, gain & 0xff);
+}
+
+/*
+ * Channel volume only reaches the PA while both companders are off: with a
+ * compander on, the PA gain follows the gain codes the RX macro sends over
+ * SoundWire instead. Like the mute controls these are shadow writes, so they
+ * take effect on the bank switch that commits the unmute below.
+ */
+static void wcd9378_hph_set_channel_volume(struct snd_soc_component *component)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+
+	if (wcd9378->comp1_enable || wcd9378->comp2_enable)
+		return;
+
+	wcd9378_hph_write_volume(component, WCD9378_FU42_CH_VOL_CH1_MSB,
+				 WCD9378_FU42_CH_VOL_CH1_LSB, wcd9378->hph_vol[0]);
+	wcd9378_hph_write_volume(component, WCD9378_FU42_CH_VOL_CH2_MSB,
+				 WCD9378_FU42_CH_VOL_CH2_LSB, wcd9378->hph_vol[1]);
+}
+
+static int wcd9378_hph_sequencer_enable(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	int hph_mode = wcd9378->hph_mode;
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (wcd9378->txdev) {
+			ret = pm_runtime_resume_and_get(wcd9378->txdev);
+			if (ret < 0)
+				dev_warn(component->dev,
+					 "txdev pm_get failed: %d\n", ret);
+			else
+				set_bit(HPH_SEQ_TX_PM, &wcd9378->status_mask);
+		}
+
+		snd_soc_component_write(component, WCD9378_CMT_GRP_MASK, 0x02);
+		/*
+		 * SYS_USAGE_CTRL must select a profile with the RX0_RX1_HPH
+		 * bit set, otherwise the HPH sequencer stays disabled and
+		 * PDE47 writes have no effect.
+		 */
+		wcd9378_sys_usage_update(component, WCD9378_SYS_USAGE_RX0_RX1_HPH, true);
+
+		if (!wcd9378->comp1_enable || !wcd9378->comp2_enable) {
+			snd_soc_component_update_bits(component, WCD9378_HPH_UP_T7, 0x07, 0x07);
+			snd_soc_component_update_bits(component, WCD9378_HPH_DN_T1, 0x07, 0x07);
+		}
+
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI ||
+		    hph_mode == CLS_AB_LP || hph_mode == CLS_AB_LOHIFI)
+			snd_soc_component_update_bits(component, WCD9378_CP_CP_DTOP_CTRL_14,
+						      BIT(7), BIT(7));
+
+		snd_soc_component_update_bits(component, WCD9378_IT41_USAGE, 0x03,
+					      wcd9378_get_hph_pwr_level(hph_mode));
+
+		snd_soc_component_update_bits(component, WCD9378_PDE47_REQ_PS, 0xff,
+					      WCD9378_PDE_PS0_ON);
+
+		wcd9378_hph_set_channel_volume(component);
+
+		if (!wcd9378->comp1_enable || !wcd9378->comp2_enable)
+			usleep_range(26000, 26100);
+		else
+			usleep_range(15000, 15100);
+
+		snd_soc_component_write(component, WCD9378_FU42_MUTE_CH1_CN, 0x00);
+		snd_soc_component_write(component, WCD9378_FU42_MUTE_CH2_CN, 0x00);
+		wcd9378_sdw_commit(component, wcd9378);
+
+		ret = wcd9378_pde_act_ps_check(component, WCD9378_PDE47_ACT_PS,
+					       WCD9378_PDE_PS0_ON);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, WCD9378_PDE47_REQ_PS, 0xff,
+					      WCD9378_PDE_PS3_OFF);
+
+		if (!wcd9378->comp1_enable || !wcd9378->comp2_enable)
+			usleep_range(30000, 30100);
+		else
+			usleep_range(17000, 17100);
+
+		ret = wcd9378_pde_act_ps_check(component, WCD9378_PDE47_ACT_PS,
+					       WCD9378_PDE_PS3_OFF);
+		snd_soc_component_write(component, WCD9378_FU42_MUTE_CH1_CN, 0x01);
+		snd_soc_component_write(component, WCD9378_FU42_MUTE_CH2_CN, 0x01);
+		wcd9378_sdw_commit(component, wcd9378);
+		wcd9378_sys_usage_update(component, WCD9378_SYS_USAGE_RX0_RX1_HPH, false);
+
+		if (wcd9378->txdev &&
+		    test_bit(HPH_SEQ_TX_PM, &wcd9378->status_mask)) {
+			pm_runtime_put_autosuspend(wcd9378->txdev);
+			clear_bit(HPH_SEQ_TX_PM, &wcd9378->status_mask);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int wcd9378_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	int hph_mode = wcd9378->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (wcd9378->txdev)
+			pm_runtime_resume_and_get(wcd9378->txdev);
+		wcd9378_rx_clk_enable(component);
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_CLK_CTL1,
+					      BIT(7), 0x00);
+		set_bit(HPH_COMP_DELAY, &wcd9378->status_mask);
+		snd_soc_component_update_bits(component,
+					      WCD9378_CDC_HPH_GAIN_CTL,
+					      WCD9378_CDC_HPH_GAIN_CTL_HPHL_RX_EN,
+					      WCD9378_CDC_HPH_GAIN_CTL_HPHL_RX_EN);
+		snd_soc_component_update_bits(component, WCD9378_CDC_COMP_CTL_0,
+					      WCD9378_CDC_COMP_CTL_0_HPHL_COMP_EN,
+					      wcd9378->comp1_enable ?
+					      WCD9378_CDC_COMP_CTL_0_HPHL_COMP_EN : 0);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (hph_mode == CLS_AB_HIFI || hph_mode == CLS_H_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD9378_HPH_RDAC_HD2_CTL_L,
+						      0x0f, BIT(1));
+		else if (hph_mode == CLS_H_LOHIFI)
+			snd_soc_component_update_bits(component,
+						      WCD9378_HPH_RDAC_HD2_CTL_L,
+						      0x0f, 0x06);
+		if (wcd9378->comp1_enable) {
+			if (test_bit(HPH_COMP_DELAY, &wcd9378->status_mask)) {
+				usleep_range(5000, 5110);
+				clear_bit(HPH_COMP_DELAY, &wcd9378->status_mask);
+			}
+		}
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_TIMER1,
+					      BIT(1), 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_HD2_CTL_L,
+					      0x0f, BIT(0));
+		snd_soc_component_update_bits(component,
+					      WCD9378_CDC_HPH_GAIN_CTL,
+					      WCD9378_CDC_HPH_GAIN_CTL_HPHL_RX_EN, 0);
+		if (wcd9378->txdev)
+			pm_runtime_put_autosuspend(wcd9378->txdev);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd9378_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	int hph_mode = wcd9378->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd9378_rx_clk_enable(component);
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_CLK_CTL1,
+					      BIT(7), 0x00);
+		set_bit(HPH_COMP_DELAY, &wcd9378->status_mask);
+		snd_soc_component_update_bits(component,
+					      WCD9378_CDC_HPH_GAIN_CTL,
+					      WCD9378_CDC_HPH_GAIN_CTL_HPHR_RX_EN,
+					      WCD9378_CDC_HPH_GAIN_CTL_HPHR_RX_EN);
+		snd_soc_component_update_bits(component, WCD9378_CDC_COMP_CTL_0,
+					      WCD9378_CDC_COMP_CTL_0_HPHR_COMP_EN,
+					      wcd9378->comp2_enable ?
+					      WCD9378_CDC_COMP_CTL_0_HPHR_COMP_EN : 0);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (hph_mode == CLS_AB_HIFI || hph_mode == CLS_H_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD9378_HPH_RDAC_HD2_CTL_R,
+						      0x0f, BIT(1));
+		else if (hph_mode == CLS_H_LOHIFI)
+			snd_soc_component_update_bits(component,
+						      WCD9378_HPH_RDAC_HD2_CTL_R,
+						      0x0f, 0x06);
+		if (wcd9378->comp2_enable) {
+			if (test_bit(HPH_COMP_DELAY, &wcd9378->status_mask)) {
+				usleep_range(5000, 5110);
+				clear_bit(HPH_COMP_DELAY, &wcd9378->status_mask);
+			}
+		}
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_TIMER1,
+					      BIT(1), 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_HD2_CTL_R,
+					      0x0f, BIT(0));
+		snd_soc_component_update_bits(component,
+					      WCD9378_CDC_HPH_GAIN_CTL,
+					      WCD9378_CDC_HPH_GAIN_CTL_HPHR_RX_EN, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd9378_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	int hph_mode = wcd9378->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Wake the TX slave so its regmap is not in cache-only mode */
+		if (wcd9378->txdev)
+			pm_runtime_get_sync(wcd9378->txdev);
+		snd_soc_component_update_bits(component,
+					      WCD9378_ANA_HPH, BIT(5), BIT(5));
+		usleep_range(100, 110);
+		set_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (test_bit(HPH_PA_DELAY, &wcd9378->status_mask)) {
+			if (!wcd9378->comp1_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		}
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_TIMER1,
+					      BIT(1), BIT(1));
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD9378_ANA_RX_SUPPLIES,
+						      BIT(1), BIT(1));
+		enable_irq(wcd9378->hphl_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd9378->hphl_pdm_wd_int);
+		set_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		/* MBHC notification intentionally omitted; MBHC not implemented yet */
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (test_bit(HPH_PA_DELAY, &wcd9378->status_mask)) {
+			if (!wcd9378->comp1_enable)
+				usleep_range(20000, 20100);
+			else
+				usleep_range(7000, 7100);
+			clear_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		}
+		snd_soc_component_update_bits(component,
+					      WCD9378_ANA_HPH, BIT(5), 0x00);
+		if (wcd9378->txdev)
+			pm_runtime_put_autosuspend(wcd9378->txdev);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd9378_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	int hph_mode = wcd9378->hph_mode;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Wake the TX slave so its regmap is not in cache-only mode */
+		if (wcd9378->txdev)
+			pm_runtime_get_sync(wcd9378->txdev);
+		snd_soc_component_update_bits(component,
+					      WCD9378_ANA_HPH, BIT(4), BIT(4));
+		usleep_range(100, 110);
+		set_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		if (test_bit(HPH_PA_DELAY, &wcd9378->status_mask)) {
+			if (wcd9378->comp2_enable)
+				usleep_range(7000, 7100);
+			else
+				usleep_range(20000, 20100);
+			clear_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		}
+		snd_soc_component_update_bits(component,
+					      WCD9378_HPH_RDAC_TIMER1,
+					      BIT(1), BIT(1));
+		if (hph_mode == CLS_AB || hph_mode == CLS_AB_HIFI)
+			snd_soc_component_update_bits(component,
+						      WCD9378_ANA_RX_SUPPLIES,
+						      BIT(1), BIT(1));
+		enable_irq(wcd9378->hphr_pdm_wd_int);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		disable_irq_nosync(wcd9378->hphr_pdm_wd_int);
+		set_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		/* MBHC notification intentionally omitted; MBHC not implemented yet */
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (test_bit(HPH_PA_DELAY, &wcd9378->status_mask)) {
+			if (wcd9378->comp2_enable)
+				usleep_range(7000, 7100);
+			else
+				usleep_range(20000, 20100);
+			clear_bit(HPH_PA_DELAY, &wcd9378->status_mask);
+		}
+		snd_soc_component_update_bits(component,
+					      WCD9378_ANA_HPH, BIT(4), 0x00);
+		if (wcd9378->txdev)
+			pm_runtime_put_autosuspend(wcd9378->txdev);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd9378_enable_rx1(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	if (event == SND_SOC_DAPM_POST_PMD)
+		wcd9378_rx_clk_disable(component);
+
+	return 0;
+}
+
+static int wcd9378_enable_rx2(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	if (event == SND_SOC_DAPM_POST_PMD)
+		wcd9378_rx_clk_disable(component);
+
+	return 0;
+}
+
+static int wcd9378_micbias_control(struct snd_soc_component *component,
+				   int micb_num, int req)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	int mb_index = micb_num - 1;
+	u32 usage_reg;
+	u8 usage_val;
+	u8 pullup_bit;
+
+	if (micb_num < MIC_BIAS_1 || micb_num > MIC_BIAS_3)
+		return -EINVAL;
+
+	usage_reg = wcd9378_smp_mic[mb_index].micb_reg;
+	usage_val = wcd9378->micb_usage_val[mb_index];
+	pullup_bit = BIT(mb_index);
+
+	mutex_lock(&wcd9378->micb_lock);
+
+	switch (req) {
+	case MICB_ENABLE:
+		wcd9378->micb_ref[mb_index]++;
+		if (wcd9378->micb_ref[mb_index] == 1) {
+			if (micb_num == MIC_BIAS_2) {
+				snd_soc_component_update_bits(component,
+							      WCD9378_ANA_MICB2_RAMP,
+							      WCD9378_ANA_MICB2_RAMP_SHIFT_CTL_MASK,
+							      0x0c);
+				snd_soc_component_update_bits(component,
+							      WCD9378_ANA_MICB2_RAMP,
+							      WCD9378_ANA_MICB2_RAMP_EN, 0x00);
+			}
+			snd_soc_component_update_bits(component, usage_reg,
+						      0xff, usage_val);
+			if (micb_num == MIC_BIAS_2)
+				snd_soc_component_update_bits(component,
+							      WCD9378_SMP_JACK_IT31_MICB,
+							      0xff, usage_val);
+		}
+		break;
+	case MICB_DISABLE:
+		if (wcd9378->micb_ref[mb_index] > 0)
+			wcd9378->micb_ref[mb_index]--;
+		if (wcd9378->micb_ref[mb_index] == 0 &&
+		    wcd9378->pullup_ref[mb_index] > 0) {
+			snd_soc_component_update_bits(component,
+						      WCD9378_MB_PULLUP_EN,
+						      pullup_bit, pullup_bit);
+			snd_soc_component_update_bits(component, usage_reg, 0xff,
+						      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
+			if (micb_num == MIC_BIAS_2)
+				snd_soc_component_update_bits(component,
+							      WCD9378_SMP_JACK_IT31_MICB, 0xff,
+							      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
+		} else if (wcd9378->micb_ref[mb_index] == 0) {
+			snd_soc_component_update_bits(component, usage_reg,
+						      0xff, WCD9378_MICB_USAGE_OFF);
+			if (micb_num == MIC_BIAS_2) {
+				snd_soc_component_update_bits(component,
+							      WCD9378_SMP_JACK_IT31_MICB,
+							      0xff, WCD9378_MICB_USAGE_OFF);
+				snd_soc_component_update_bits(component,
+							      WCD9378_ANA_MICB2_RAMP,
+							      WCD9378_ANA_MICB2_RAMP_SHIFT_CTL_MASK,
+							      0x0c);
+				snd_soc_component_update_bits(component,
+							      WCD9378_ANA_MICB2_RAMP,
+							      WCD9378_ANA_MICB2_RAMP_EN,
+							      WCD9378_ANA_MICB2_RAMP_EN);
+			}
+		}
+		break;
+	case MICB_PULLUP_ENABLE:
+		wcd9378->pullup_ref[mb_index]++;
+		if (wcd9378->pullup_ref[mb_index] == 1 &&
+		    wcd9378->micb_ref[mb_index] == 0) {
+			snd_soc_component_update_bits(component,
+						      WCD9378_MB_PULLUP_EN,
+						      pullup_bit, pullup_bit);
+			snd_soc_component_update_bits(component, usage_reg, 0xff,
+						      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
+			if (micb_num == MIC_BIAS_2)
+				snd_soc_component_update_bits(component,
+							      WCD9378_SMP_JACK_IT31_MICB, 0xff,
+							      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
+		}
+		break;
+	case MICB_PULLUP_DISABLE:
+		if (wcd9378->pullup_ref[mb_index] > 0)
+			wcd9378->pullup_ref[mb_index]--;
+		if (wcd9378->pullup_ref[mb_index] == 0 &&
+		    wcd9378->micb_ref[mb_index] == 0) {
+			snd_soc_component_update_bits(component,
+						      WCD9378_MB_PULLUP_EN, pullup_bit, 0x00);
+			snd_soc_component_update_bits(component, usage_reg, 0xff,
+						      WCD9378_MICB_USAGE_PULL_DOWN);
+			if (micb_num == MIC_BIAS_2)
+				snd_soc_component_update_bits(component,
+							      WCD9378_SMP_JACK_IT31_MICB, 0xff,
+							      WCD9378_MICB_USAGE_PULL_DOWN);
+		}
+		break;
+	}
+
+	mutex_unlock(&wcd9378->micb_lock);
+
+	return 0;
+}
+
+static int wcd9378_codec_enable_micbias(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd9378_micbias_control(component, micb_num, MICB_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd9378_micbias_control(component, micb_num, MICB_DISABLE);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd9378_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
+					       struct snd_kcontrol *kcontrol,
+					       int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd9378_micbias_control(component, micb_num,
+					MICB_PULLUP_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd9378_micbias_control(component, micb_num,
+					MICB_PULLUP_DISABLE);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd9378_connect_port(struct wcd9378_sdw_priv *wcd, u8 port_idx,
+				u8 ch_id, bool enable)
+{
+	struct sdw_port_config *port_config = &wcd->port_config[port_idx - 1];
+	const struct wcd_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
+	u8 port_num = ch_info->port_num;
+	u8 ch_mask = ch_info->ch_mask;
+	u8 mstr_port_num, mstr_ch_mask;
+	struct sdw_slave *sdev = wcd->sdev;
+
+	port_config->num = port_num;
+
+	mstr_port_num = sdev->m_port_map[port_num];
+	mstr_ch_mask = ch_info->master_ch_mask;
+
+	if (enable) {
+		port_config->ch_mask |= ch_mask;
+		wcd->master_channel_map[mstr_port_num] |= mstr_ch_mask;
+	} else {
+		port_config->ch_mask &= ~ch_mask;
+		wcd->master_channel_map[mstr_port_num] &= ~mstr_ch_mask;
+	}
+
+	return 0;
+}
+
+static int wcd9378_get_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(comp->dev);
+	struct wcd9378_sdw_priv *wcd;
+	int dai_id = mixer->shift;
+	int ch_idx = mixer->reg;
+	int portidx;
+
+	wcd = wcd9378->sdw_priv[dai_id];
+	portidx = wcd->ch_info[ch_idx].port_num;
+
+	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
+
+	return 0;
+}
+
+static int wcd9378_set_swr_port(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(comp->dev);
+	struct wcd9378_sdw_priv *wcd;
+	int dai_id = mixer->shift;
+	int ch_idx = mixer->reg;
+	int portidx;
+	bool enable;
+
+	wcd = wcd9378->sdw_priv[dai_id];
+	portidx = wcd->ch_info[ch_idx].port_num;
+
+	enable = ucontrol->value.integer.value[0];
+
+	if (enable == wcd->port_enable[portidx]) {
+		wcd9378_connect_port(wcd, portidx, ch_idx, enable);
+		return 0;
+	}
+
+	wcd->port_enable[portidx] = enable;
+	wcd9378_connect_port(wcd, portidx, ch_idx, enable);
+
+	return 1;
+}
+
+static int wcd9378_get_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(comp->dev);
+	bool hphr = mixer->shift;
+
+	ucontrol->value.integer.value[0] = hphr ? wcd9378->comp2_enable :
+						  wcd9378->comp1_enable;
+
+	return 0;
+}
+
+/*
+ * The compander gain codes are generated by the RX macro and carried to the
+ * codec over its own SoundWire channels, so enabling a compander means both
+ * flagging it here -- the HPH DAC and sequencer events consume the flag -- and
+ * connecting the matching COMP channel, as for any other RX channel.
+ */
+static int wcd9378_set_compander(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(comp->dev);
+	bool enable = ucontrol->value.integer.value[0];
+	struct wcd9378_sdw_priv *wcd;
+	bool hphr = mixer->shift;
+	int ch_idx = mixer->reg;
+	int portidx;
+
+	if (hphr) {
+		if (enable == wcd9378->comp2_enable)
+			return 0;
+
+		wcd9378->comp2_enable = enable;
+	} else {
+		if (enable == wcd9378->comp1_enable)
+			return 0;
+
+		wcd9378->comp1_enable = enable;
+	}
+
+	wcd = wcd9378->sdw_priv[AIF1_PB];
+	portidx = wcd->ch_info[ch_idx].port_num;
+
+	wcd9378_connect_port(wcd, portidx, ch_idx, enable);
+
+	return 1;
+}
+
+static int wcd9378_hph_get_gain(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(comp->dev);
+
+	ucontrol->value.integer.value[0] = wcd9378->hph_vol[mixer->shift];
+
+	return 0;
+}
+
+/*
+ * The gain is programmed by the HPH sequencer when the path powers up, so a
+ * change made while the headphone is running takes effect on its next
+ * power-up.
+ */
+static int wcd9378_hph_put_gain(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(comp->dev);
+	unsigned int steps = ucontrol->value.integer.value[0];
+
+	if (steps > WCD9378_HPH_VOL_STEPS)
+		return -EINVAL;
+
+	if (steps == wcd9378->hph_vol[mixer->shift])
+		return 0;
+
+	wcd9378->hph_vol[mixer->shift] = steps;
+
+	return 1;
+}
+
+static int wcd9378_tx_mode_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int adc = e->shift_l;
+
+	ucontrol->value.enumerated.item[0] = wcd9378->tx_mode[adc];
+
+	return 0;
+}
+
+static int wcd9378_tx_mode_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int adc = e->shift_l;
+	u32 mode_val = ucontrol->value.enumerated.item[0];
+
+	if (mode_val >= e->items)
+		return -EINVAL;
+
+	if (mode_val == wcd9378->tx_mode[adc])
+		return 0;
+
+	wcd9378->tx_mode[adc] = mode_val;
+
+	return 1;
+}
+
+static int wcd9378_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+
+	ucontrol->value.enumerated.item[0] = wcd9378->hph_mode;
+
+	return 0;
+}
+
+static int wcd9378_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	u32 mode_val = ucontrol->value.enumerated.item[0];
+
+	if (mode_val == wcd9378->hph_mode)
+		return 0;
+
+	wcd9378->hph_mode = mode_val;
+
+	return 1;
+}
+
+static const char * const tx_mode_mux_text[] = {
+	"ADC_INVALID", "ADC_HIFI", "ADC_LO_HIF", "ADC_NORMAL", "ADC_LP",
+};
+
+/* Indices match enum wcd_clsh_mode; index 0 is not a usable HPH mode */
+static const char * const rx_hph_mode_mux_text[] = {
+	"CLS_H_INVALID", "CLS_H_HIFI", "CLS_H_LP", "CLS_AB", "CLS_H_LOHIFI",
+	"CLS_H_ULP", "CLS_AB_HIFI", "CLS_AB_LP", "CLS_AB_LOHIFI",
+};
+
+static const struct soc_enum rx_hph_mode_mux_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
+			    rx_hph_mode_mux_text);
+
+static const struct soc_enum tx0_mode_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text);
+static const struct soc_enum tx1_mode_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 1, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text);
+static const struct soc_enum tx2_mode_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 2, ARRAY_SIZE(tx_mode_mux_text),
+			tx_mode_mux_text);
+
+static const struct snd_kcontrol_new wcd9378_snd_controls[] = {
+	SOC_SINGLE_TLV("ADC1 Volume", WCD9378_ANA_TX_CH1, 0, 20, 0,
+		       analog_gain),
+	SOC_SINGLE_TLV("ADC2 Volume", WCD9378_ANA_TX_CH2, 0, 20, 0,
+		       analog_gain),
+	SOC_SINGLE_TLV("ADC3 Volume", WCD9378_ANA_TX_CH3, 0, 20, 0,
+		       analog_gain),
+
+	SOC_ENUM_EXT("TX0 MODE", tx0_mode_enum,
+		     wcd9378_tx_mode_get, wcd9378_tx_mode_put),
+	SOC_ENUM_EXT("TX1 MODE", tx1_mode_enum,
+		     wcd9378_tx_mode_get, wcd9378_tx_mode_put),
+	SOC_ENUM_EXT("TX2 MODE", tx2_mode_enum,
+		     wcd9378_tx_mode_get, wcd9378_tx_mode_put),
+
+	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
+		     wcd9378_rx_hph_mode_get, wcd9378_rx_hph_mode_put),
+
+	SOC_SINGLE_EXT_TLV("HPHL Volume", SND_SOC_NOPM, 0, WCD9378_HPH_VOL_STEPS, 0,
+			   wcd9378_hph_get_gain, wcd9378_hph_put_gain, hph_gain),
+	SOC_SINGLE_EXT_TLV("HPHR Volume", SND_SOC_NOPM, 1, WCD9378_HPH_VOL_STEPS, 0,
+			   wcd9378_hph_get_gain, wcd9378_hph_put_gain, hph_gain),
+
+	SOC_SINGLE_EXT("ADC1 Switch", WCD9378_ADC1, AIF1_CAP, 1, 0,
+		       wcd9378_get_swr_port, wcd9378_set_swr_port),
+	SOC_SINGLE_EXT("ADC2 Switch", WCD9378_ADC2, AIF1_CAP, 1, 0,
+		       wcd9378_get_swr_port, wcd9378_set_swr_port),
+	SOC_SINGLE_EXT("ADC3 Switch", WCD9378_ADC3, AIF1_CAP, 1, 0,
+		       wcd9378_get_swr_port, wcd9378_set_swr_port),
+
+	SOC_SINGLE_EXT("HPHL Switch", WCD9378_HPH_L, AIF1_PB, 1, 0,
+		       wcd9378_get_swr_port, wcd9378_set_swr_port),
+	SOC_SINGLE_EXT("HPHR Switch", WCD9378_HPH_R, AIF1_PB, 1, 0,
+		       wcd9378_get_swr_port, wcd9378_set_swr_port),
+	SOC_SINGLE_EXT("CLSH Switch", WCD9378_CLSH, AIF1_PB, 1, 0,
+		       wcd9378_get_swr_port, wcd9378_set_swr_port),
+
+	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD9378_COMP_L, 0, 1, 0,
+		       wcd9378_get_compander, wcd9378_set_compander),
+	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD9378_COMP_R, 1, 1, 0,
+		       wcd9378_get_compander, wcd9378_set_compander),
+};
+
+static const char * const adc1_mux_text[] = {
+	"CH1_AMIC_DISABLE", "CH1_AMIC1", "CH1_AMIC2", "CH1_AMIC3", "CH1_AMIC4",
+};
+
+static const char * const adc2_mux_text[] = {
+	"CH2_AMIC_DISABLE", "CH2_AMIC1", "CH2_AMIC2", "CH2_AMIC3", "CH2_AMIC4",
+};
+
+static const char * const adc3_mux_text[] = {
+	"CH3_AMIC_DISABLE", "CH3_AMIC1", "CH3_AMIC3", "CH3_AMIC4",
+};
+
+static const struct soc_enum adc1_mux_enum =
+	SOC_ENUM_SINGLE(WCD9378_TX_NEW_CH12_MUX, 0,
+			ARRAY_SIZE(adc1_mux_text), adc1_mux_text);
+static const struct soc_enum adc2_mux_enum =
+	SOC_ENUM_SINGLE(WCD9378_TX_NEW_CH12_MUX, 3,
+			ARRAY_SIZE(adc2_mux_text), adc2_mux_text);
+static const struct soc_enum adc3_mux_enum =
+	SOC_ENUM_SINGLE(WCD9378_TX_NEW_CH34_MUX, 0,
+			ARRAY_SIZE(adc3_mux_text), adc3_mux_text);
+
+static const struct snd_kcontrol_new adc1_mux = SOC_DAPM_ENUM("ADC1 MUX", adc1_mux_enum);
+static const struct snd_kcontrol_new adc2_mux = SOC_DAPM_ENUM("ADC2 MUX", adc2_mux_enum);
+static const struct snd_kcontrol_new adc3_mux = SOC_DAPM_ENUM("ADC3 MUX", adc3_mux_enum);
+
+static const struct snd_kcontrol_new tx0_seq_switch =
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0);
+static const struct snd_kcontrol_new tx1_seq_switch =
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0);
+static const struct snd_kcontrol_new tx2_seq_switch =
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0);
+
+static const struct snd_kcontrol_new hphl_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new hphr_rdac_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_soc_dapm_widget wcd9378_dapm_widgets[] = {
+	/* Analog mic inputs */
+	SND_SOC_DAPM_INPUT("AMIC1"),
+	SND_SOC_DAPM_INPUT("AMIC2"),
+	SND_SOC_DAPM_INPUT("AMIC3"),
+	SND_SOC_DAPM_INPUT("AMIC4"),
+
+	/* RX (HPH) input ports */
+	SND_SOC_DAPM_INPUT("IN1_HPHL"),
+	SND_SOC_DAPM_INPUT("IN2_HPHR"),
+
+	/* RX supply widgets */
+	SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("CLS_H_PORT", 1, SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* RX mixer widgets */
+	SND_SOC_DAPM_MIXER_E("RX1", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wcd9378_enable_rx1,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("RX2", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wcd9378_enable_rx2,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* HPH DAC widgets */
+	SND_SOC_DAPM_DAC_E("RDAC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd9378_codec_hphl_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RDAC2", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd9378_codec_hphr_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("HPH SEQUENCER", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wcd9378_hph_sequencer_enable,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* RDAC switch mixers */
+	SND_SOC_DAPM_MIXER("HPHL_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphl_rdac_switch, ARRAY_SIZE(hphl_rdac_switch)),
+	SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
+			   hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
+
+	/* HPH PA widgets */
+	SND_SOC_DAPM_PGA_E("HPHL PGA", WCD9378_ANA_HPH, 7, 0, NULL, 0,
+			   wcd9378_codec_enable_hphl_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHR PGA", WCD9378_ANA_HPH, 6, 0, NULL, 0,
+			   wcd9378_codec_enable_hphr_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	/* RX (HPH) output ports */
+	SND_SOC_DAPM_OUTPUT("HPHL"),
+	SND_SOC_DAPM_OUTPUT("HPHR"),
+
+	/* ADC input muxes */
+	SND_SOC_DAPM_MUX("ADC1 MUX", SND_SOC_NOPM, 0, 0, &adc1_mux),
+	SND_SOC_DAPM_MUX("ADC2 MUX", SND_SOC_NOPM, 0, 0, &adc2_mux),
+	SND_SOC_DAPM_MUX("ADC3 MUX", SND_SOC_NOPM, 0, 0, &adc3_mux),
+
+	/* SDCA TX sequencers (widget shift = ADC index) */
+	SND_SOC_DAPM_MIXER_E("TX0 SEQUENCER", SND_SOC_NOPM, 0, 0,
+			     &tx0_seq_switch, 1, wcd9378_tx_sequencer_enable,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("TX1 SEQUENCER", SND_SOC_NOPM, 1, 0,
+			     &tx1_seq_switch, 1, wcd9378_tx_sequencer_enable,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("TX2 SEQUENCER", SND_SOC_NOPM, 2, 0,
+			     &tx2_seq_switch, 1, wcd9378_tx_sequencer_enable,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* Micbias supplies (widget shift = micbias number) */
+	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
+			    wcd9378_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
+			    wcd9378_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
+			    wcd9378_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
+			    wcd9378_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
+			    wcd9378_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
+			    wcd9378_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
+	/* Outputs towards the SoundWire TX bus / LPASS TX macro */
+	SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
+};
+
+static const struct snd_soc_dapm_route wcd9378_audio_map[] = {
+	{ "ADC1_OUTPUT", NULL, "TX0 SEQUENCER" },
+	{ "TX0 SEQUENCER", "Switch", "ADC1 MUX" },
+	{ "ADC1 MUX", "CH1_AMIC1", "AMIC1" },
+	{ "ADC1 MUX", "CH1_AMIC2", "AMIC2" },
+	{ "ADC1 MUX", "CH1_AMIC3", "AMIC3" },
+	{ "ADC1 MUX", "CH1_AMIC4", "AMIC4" },
+
+	{ "ADC2_OUTPUT", NULL, "TX1 SEQUENCER" },
+	{ "TX1 SEQUENCER", "Switch", "ADC2 MUX" },
+	{ "ADC2 MUX", "CH2_AMIC1", "AMIC1" },
+	{ "ADC2 MUX", "CH2_AMIC2", "AMIC2" },
+	{ "ADC2 MUX", "CH2_AMIC3", "AMIC3" },
+	{ "ADC2 MUX", "CH2_AMIC4", "AMIC4" },
+
+	{ "ADC3_OUTPUT", NULL, "TX2 SEQUENCER" },
+	{ "TX2 SEQUENCER", "Switch", "ADC3 MUX" },
+	{ "ADC3 MUX", "CH3_AMIC1", "AMIC1" },
+	{ "ADC3 MUX", "CH3_AMIC3", "AMIC3" },
+	{ "ADC3 MUX", "CH3_AMIC4", "AMIC4" },
+
+	{ "IN1_HPHL", NULL, "VDD_BUCK" },
+	{ "IN1_HPHL", NULL, "CLS_H_PORT" },
+	{ "RX1", NULL, "IN1_HPHL" },
+	{ "HPH SEQUENCER", NULL, "RX1" },
+	{ "RDAC1", NULL, "HPH SEQUENCER" },
+	{ "HPHL_RDAC", "Switch", "RDAC1" },
+	{ "HPHL PGA", NULL, "HPHL_RDAC" },
+	{ "HPHL", NULL, "HPHL PGA" },
+
+	{ "IN2_HPHR", NULL, "VDD_BUCK" },
+	{ "IN2_HPHR", NULL, "CLS_H_PORT" },
+	{ "RX2", NULL, "IN2_HPHR" },
+	{ "HPH SEQUENCER", NULL, "RX2" },
+	{ "RDAC2", NULL, "HPH SEQUENCER" },
+	{ "HPHR_RDAC", "Switch", "RDAC2" },
+	{ "HPHR PGA", NULL, "HPHR_RDAC" },
+	{ "HPHR", NULL, "HPHR PGA" },
+};
+
+/*
+ * Map the DT micbias millivolt values onto ITxx_MICB usage codes;
+ * non-standard voltages go through the sequencer remap table.
+ */
+static void wcd9378_set_micb_usage_vals(struct snd_soc_component *component)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	static const u32 remap_regs[] = {
+		WCD9378_MICB_REMAP_TABLE_VAL_3,
+		WCD9378_MICB_REMAP_TABLE_VAL_4,
+		WCD9378_MICB_REMAP_TABLE_VAL_5,
+	};
+	int i, vout;
+
+	for (i = 0; i < WCD9378_MAX_MICBIAS; i++) {
+		switch (wcd9378->common.micb_mv[i]) {
+		case 1200:
+			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_1P2V;
+			break;
+		case 1800:
+			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_1P8V_OR_PULLUP;
+			break;
+		case 2200:
+			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P2V;
+			break;
+		case 2500:
+			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P5V;
+			break;
+		case 2700:
+			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P7V;
+			break;
+		case 2750:
+			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P75V;
+			break;
+		case 2800:
+			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P8V;
+			break;
+		default:
+			vout = wcd_get_micb_vout_ctl_val(component->dev,
+							 wcd9378->common.micb_mv[i]);
+			if (vout < 0) {
+				wcd9378->micb_usage_val[i] =
+					WCD9378_MICB_USAGE_1P8V_OR_PULLUP;
+				break;
+			}
+			snd_soc_component_update_bits(component, remap_regs[i],
+						      0xff, vout);
+			wcd9378->micb_usage_val[i] =
+				WCD9378_MICB_USAGE_REMAP_TABLE_3 + i;
+			break;
+		}
+	}
+}
+
+static const struct regmap_irq wcd9378_irqs[WCD9378_NUM_IRQS] = {
+	REGMAP_IRQ_REG(WCD9378_IRQ_MBHC_BUTTON_PRESS_DET,	0, BIT(0)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_MBHC_BUTTON_RELEASE_DET,	0, BIT(1)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_MBHC_ELECT_INS_REM_DET,	0, BIT(2)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_MBHC_ELECT_INS_REM_LEG_DET,	0, BIT(3)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_MBHC_SW_DET,		0, BIT(4)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHR_OCP_INT,		0, BIT(5)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHR_CNP_INT,		0, BIT(6)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHL_OCP_INT,		0, BIT(7)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHL_CNP_INT,		1, BIT(0)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_EAR_CNP_INT,		1, BIT(1)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_EAR_SCD_INT,		1, BIT(2)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_AUX_CNP_INT,		1, BIT(3)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_AUX_SCD_INT,		1, BIT(4)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHL_PDM_WD_INT,		1, BIT(5)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHR_PDM_WD_INT,		1, BIT(6)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_AUX_PDM_WD_INT,		1, BIT(7)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_LDORT_SCD_INT,		2, BIT(0)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_MBHC_MOISTURE_INT,		2, BIT(1)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHL_SURGE_DET_INT,		2, BIT(2)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_HPHR_SURGE_DET_INT,		2, BIT(3)),
+	REGMAP_IRQ_REG(WCD9378_IRQ_SAPU_PROT_MODE_CHG,		2, BIT(6)),
+};
+
+static int wcd9378_handle_post_irq(void *data)
+{
+	struct wcd9378_priv *wcd9378 = data;
+
+	/* Clear SDCA interrupt status registers (RW1C) */
+	regmap_write(wcd9378->regmap, WCD9378_SWRS_SCP_SDCA_INTSTAT_1, 0xff);
+	regmap_write(wcd9378->regmap, WCD9378_SWRS_SCP_SDCA_INTSTAT_2, 0xff);
+	regmap_write(wcd9378->regmap, WCD9378_SWRS_SCP_SDCA_INTSTAT_3, 0xff);
+
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_irq_chip wcd9378_regmap_irq_chip = {
+	.name = "wcd9378",
+	.irqs = wcd9378_irqs,
+	.num_irqs = ARRAY_SIZE(wcd9378_irqs),
+	.num_regs = 3,
+	.status_base = WCD9378_SWRS_SCP_SDCA_INTSTAT_1,
+	/* SDCA_INTMASK is an unmask register: a set bit enables the source */
+	.unmask_base = WCD9378_SWRS_SCP_SDCA_INTMASK_1,
+	.ack_base = WCD9378_SWRS_SCP_SDCA_INTSTAT_1,
+	.use_ack = 1,
+	.clear_ack = 1,
+	.runtime_pm = true,
+	.handle_post_irq = wcd9378_handle_post_irq,
+	/* irq_drv_data is set on the per-instance copy made in wcd9378_irq_init() */
+};
+
+/*
+ * Setup a virtual interrupt domain to hook regmap_irq. The root domain
+ * has a single interrupt whose mapping triggers the regmap_irq handler:
+ *
+ *   soundwire interrupt_callback()
+ *   \- handle_nested_irq(0)
+ *      \- regmap_irq_thread()
+ *          \- handle_nested_irq(i)
+ */
+static const struct irq_chip wcd9378_irq_chip = {
+	.name = "WCD9378",
+};
+
+static int wcd9378_irq_chip_map(struct irq_domain *irqd, unsigned int virq,
+				irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(virq, &wcd9378_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops wcd9378_domain_ops = {
+	.map = wcd9378_irq_chip_map,
+};
+
+static int wcd9378_irq_init(struct wcd9378_priv *wcd9378, struct device *dev)
+{
+	struct regmap_irq_chip *chip_desc;
+
+	wcd9378->virq = irq_domain_create_linear(NULL, 1, &wcd9378_domain_ops, NULL);
+	if (!wcd9378->virq) {
+		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
+		return -EINVAL;
+	}
+
+	/*
+	 * regmap-irq keeps the descriptor by reference and passes
+	 * irq_drv_data to handle_post_irq(), so take a per-instance
+	 * copy and point it at this codec.
+	 */
+	chip_desc = devm_kmemdup(dev, &wcd9378_regmap_irq_chip,
+				 sizeof(wcd9378_regmap_irq_chip), GFP_KERNEL);
+	if (!chip_desc)
+		return -ENOMEM;
+
+	chip_desc->irq_drv_data = wcd9378;
+	wcd9378->chip_desc = chip_desc;
+
+	return devm_regmap_add_irq_chip(dev, wcd9378->regmap,
+					irq_create_mapping(wcd9378->virq, 0),
+					IRQF_ONESHOT, 0,
+					wcd9378->chip_desc,
+					&wcd9378->irq_chip);
+}
+
+/*
+ * HPHL/HPHR PDM watchdog interrupt threaded handler. These are enabled
+ * while the corresponding PA is powered so the regmap_irq core acks them
+ * and keeps PDM in sync; there is nothing else to do here.
+ */
+static irqreturn_t wcd9378_wd_handle_irq(int irq, void *data)
+{
+	return IRQ_HANDLED;
+}
+
+static int wcd9378_soc_codec_probe(struct snd_soc_component *component)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+	struct device *dev = component->dev;
+	unsigned int part0 = 0, part1 = 0;
+	int ret;
+
+	/*
+	 * Flow up to this point: the TX probe reset the codec and added the
+	 * component master, the RX probe registered its component, and the
+	 * master's bind then registered this snd_soc component. io_init()
+	 * below programs the analog core and must hit an enumerated codec
+	 * with the bus clock indicated, so first wait out both slaves'
+	 * post-reset (re-)enumeration; this codec probe is the earliest
+	 * point where all of that holds.
+	 */
+	ret = sdw_slave_wait_for_init(wcd9378->tx_sdw_dev, 5000);
+	if (ret)
+		return ret;
+
+	ret = sdw_slave_wait_for_init(dev_to_sdw_dev(wcd9378->rxdev), 5000);
+	if (ret)
+		return ret;
+
+	snd_soc_component_init_regmap(component, wcd9378->regmap);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	regmap_read(wcd9378->regmap, WCD9378_DEV_PART_ID_0, &part0);
+	regmap_read(wcd9378->regmap, WCD9378_DEV_PART_ID_1, &part1);
+	dev_dbg(dev, "WCD9378 part id %#x\n", (part1 << 8) | part0);
+
+	/*
+	 * SDCA interrupt type configuration. Nothing consumes these
+	 * interrupts yet (no MBHC support); kept so the bring-up sequence
+	 * validated on hardware is unchanged.
+	 */
+	snd_soc_component_write(component, WCD9378_SWRS_SCP_SDCA_INTRTYPE_1, 0xff);
+	snd_soc_component_write(component, WCD9378_SWRS_SCP_SDCA_INTRTYPE_2, 0x0b);
+	snd_soc_component_write(component, WCD9378_SWRS_SCP_SDCA_INTRTYPE_3, 0xff);
+
+	wcd9378_io_init(component);
+	wcd9378_set_micb_usage_vals(component);
+
+	ret = wcd9378_irq_init(wcd9378, dev);
+	if (ret) {
+		dev_err(dev, "IRQ init failed: %d\n", ret);
+		goto err_pm_put;
+	}
+
+	/* let the SoundWire alert handlers dispatch into the regmap_irq domain */
+	wcd9378->sdw_priv[AIF1_PB]->slave_irq = wcd9378->virq;
+	wcd9378->sdw_priv[AIF1_CAP]->slave_irq = wcd9378->virq;
+
+	wcd9378->hphr_pdm_wd_int = regmap_irq_get_virq(wcd9378->irq_chip,
+						       WCD9378_IRQ_HPHR_PDM_WD_INT);
+	wcd9378->hphl_pdm_wd_int = regmap_irq_get_virq(wcd9378->irq_chip,
+						       WCD9378_IRQ_HPHL_PDM_WD_INT);
+
+	ret = request_threaded_irq(wcd9378->hphr_pdm_wd_int, NULL,
+				   wcd9378_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHR PDM WD INT", wcd9378);
+	if (ret) {
+		dev_err(dev, "Failed to request HPHR WD interrupt (%d)\n", ret);
+		goto err_pm_put;
+	}
+
+	ret = request_threaded_irq(wcd9378->hphl_pdm_wd_int, NULL,
+				   wcd9378_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHL PDM WD INT", wcd9378);
+	if (ret) {
+		dev_err(dev, "Failed to request HPHL WD interrupt (%d)\n", ret);
+		goto err_free_hphr_pdm_wd_int;
+	}
+
+	/* Disable watchdog interrupts until the corresponding PA is enabled */
+	disable_irq_nosync(wcd9378->hphr_pdm_wd_int);
+	disable_irq_nosync(wcd9378->hphl_pdm_wd_int);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+err_free_hphr_pdm_wd_int:
+	free_irq(wcd9378->hphr_pdm_wd_int, wcd9378);
+err_pm_put:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static void wcd9378_soc_codec_remove(struct snd_soc_component *component)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(component->dev);
+
+	free_irq(wcd9378->hphl_pdm_wd_int, wcd9378);
+	free_irq(wcd9378->hphr_pdm_wd_int, wcd9378);
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_wcd9378 = {
+	.name = "wcd9378_codec",
+	.probe = wcd9378_soc_codec_probe,
+	.remove = wcd9378_soc_codec_remove,
+	.controls = wcd9378_snd_controls,
+	.num_controls = ARRAY_SIZE(wcd9378_snd_controls),
+	.dapm_widgets = wcd9378_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wcd9378_dapm_widgets),
+	.dapm_routes = wcd9378_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd9378_audio_map),
+	.endianness = 1,
+};
+
+static int wcd9378_codec_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(dai->dev);
+	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
+
+	return wcd9378_sdw_hw_params(wcd, substream, params, dai);
+}
+
+static int wcd9378_codec_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(dai->dev);
+	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
+
+	return sdw_stream_remove_slave(wcd->sdev, wcd->sruntime);
+}
+
+static int wcd9378_codec_set_sdw_stream(struct snd_soc_dai *dai,
+					void *stream, int direction)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(dai->dev);
+	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
+
+	wcd->sruntime = stream;
+
+	return 0;
+}
+
+static int wcd9378_get_channel_map(const struct snd_soc_dai *dai,
+				   unsigned int *tx_num, unsigned int *tx_slot,
+				   unsigned int *rx_num, unsigned int *rx_slot)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(dai->dev);
+	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
+	int i;
+
+	switch (dai->id) {
+	case AIF1_PB:
+		if (!rx_slot || !rx_num) {
+			dev_err(dai->dev, "Invalid rx_slot %p or rx_num %p\n",
+				rx_slot, rx_num);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < SDW_MAX_PORTS; i++)
+			rx_slot[i] = wcd->master_channel_map[i];
+
+		*rx_num = i;
+		break;
+	case AIF1_CAP:
+		if (!tx_slot || !tx_num) {
+			dev_err(dai->dev, "Invalid tx_slot %p or tx_num %p\n",
+				tx_slot, tx_num);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < SDW_MAX_PORTS; i++)
+			tx_slot[i] = wcd->master_channel_map[i];
+
+		*tx_num = i;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops wcd9378_sdw_dai_ops = {
+	.hw_params = wcd9378_codec_hw_params,
+	.hw_free = wcd9378_codec_free,
+	.set_stream = wcd9378_codec_set_sdw_stream,
+	.get_channel_map = wcd9378_get_channel_map,
+};
+
+#define WCD9378_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+		       SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
+#define WCD9378_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver wcd9378_dais[] = {
+	[0] = {
+		.name = "wcd9378-sdw-rx",
+		.playback = {
+			.stream_name = "WCD AIF Playback",
+			.rates = WCD9378_RATES,
+			.formats = WCD9378_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 192000,
+			.channels_min = 1,
+			.channels_max = 4,
+		},
+		.ops = &wcd9378_sdw_dai_ops,
+	},
+	[1] = {
+		.name = "wcd9378-sdw-tx",
+		.capture = {
+			.stream_name = "WCD AIF Capture",
+			.rates = WCD9378_RATES,
+			.formats = WCD9378_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 192000,
+			.channels_min = 1,
+			.channels_max = 4,
+		},
+		.ops = &wcd9378_sdw_dai_ops,
+	},
+};
+
+static int wcd9378_bind(struct device *dev)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(dev);
+	int ret;
+
+	ret = component_bind_all(dev, wcd9378);
+	if (ret) {
+		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	wcd9378->rxdev = of_sdw_find_device_by_node(wcd9378->rxnode);
+	if (!wcd9378->rxdev) {
+		dev_err(dev, "could not find rx slave with matching of node\n");
+		ret = -EINVAL;
+		goto err_component_unbind;
+	}
+
+	wcd9378->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd9378->rxdev);
+	wcd9378->sdw_priv[AIF1_PB]->wcd9378 = wcd9378;
+
+	/*
+	 * As TX is the main CSR reg interface, it should not be suspended
+	 * first. Explicitly add the dependency link.
+	 */
+	if (!device_link_add(wcd9378->rxdev, dev,
+			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
+		dev_err(dev, "Could not devlink TX and RX\n");
+		ret = -EINVAL;
+		goto err_put_rxdev;
+	}
+
+	/*
+	 * The SDCA function engine dies when the TX bus enters clock-stop
+	 * and only a codec reset revives it - registers keep their values
+	 * so a regcache sync or a FUNC_ACT re-toggle does not help. The
+	 * only way to avoid it is to keep the TX bus out of clock-stop, so
+	 * keep this device (and thus its bus) runtime-active while the
+	 * codec is bound.
+	 */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "could not resume TX device\n");
+		goto err_remove_link;
+	}
+
+	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd9378,
+					 wcd9378_dais, ARRAY_SIZE(wcd9378_dais));
+	if (ret) {
+		dev_err(dev, "Codec registration failed\n");
+		pm_runtime_put_sync(dev);
+		goto err_remove_link;
+	}
+
+	return 0;
+
+err_remove_link:
+	device_link_remove(wcd9378->rxdev, dev);
+err_put_rxdev:
+	put_device(wcd9378->rxdev);
+err_component_unbind:
+	component_unbind_all(dev, wcd9378);
+	return ret;
+}
+
+static void wcd9378_unbind(struct device *dev)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(dev);
+
+	snd_soc_unregister_component(dev);
+	pm_runtime_put_sync(dev);
+	device_link_remove(wcd9378->rxdev, dev);
+	component_unbind_all(dev, wcd9378);
+	put_device(wcd9378->rxdev);
+}
+
+static const struct component_master_ops wcd9378_comp_ops = {
+	.bind = wcd9378_bind,
+	.unbind = wcd9378_unbind,
+};
+
+/*
+ * The codec has no representation of its own on any bus: the TX SoundWire
+ * device is the one that reaches the control register space, so it owns the
+ * reset line, the supplies and the mic-bias description, and it aggregates
+ * the data-only RX device named by its qcom,rx-device phandle.
+ */
+int wcd9378_tx_master_probe(struct device *dev, struct wcd9378_sdw_priv *wcd)
+{
+	struct component_match *match = NULL;
+	struct wcd9378_priv *wcd9378;
+	int ret, i;
+
+	wcd9378 = devm_kzalloc(dev, sizeof(*wcd9378), GFP_KERNEL);
+	if (!wcd9378)
+		return -ENOMEM;
+
+	mutex_init(&wcd9378->micb_lock);
+	mutex_init(&wcd9378->sys_usage_lock);
+	for (i = 0; i < ARRAY_SIZE(wcd9378->tx_sys_bit); i++)
+		wcd9378->tx_sys_bit[i] = -1;
+	for (i = 0; i < ARRAY_SIZE(wcd9378->hph_vol); i++)
+		wcd9378->hph_vol[i] = WCD9378_HPH_VOL_STEPS;
+	wcd9378->common.dev = dev;
+	wcd9378->common.max_bias = WCD9378_MAX_MICBIAS;
+
+	wcd->wcd9378 = wcd9378;
+	wcd9378->sdw_priv[AIF1_CAP] = wcd;
+	wcd9378->txdev = dev;
+	wcd9378->tx_sdw_dev = wcd->sdev;
+	wcd9378->regmap = wcd->regmap;
+
+	wcd9378->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(wcd9378->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd9378->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd9378_supplies),
+					     wcd9378_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get and enable supplies\n");
+
+	ret = wcd_dt_parse_micbias_info(&wcd9378->common);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get micbias\n");
+
+	wcd9378->rxnode = of_parse_phandle(dev->of_node, "qcom,rx-device", 0);
+	if (!wcd9378->rxnode)
+		return dev_err_probe(dev, -ENODEV,
+				     "Couldn't parse phandle to qcom,rx-device\n");
+
+	component_match_add_release(dev, &match, component_release_of,
+				    component_compare_of, wcd9378->rxnode);
+
+	wcd9378_reset(wcd9378);
+
+	/*
+	 * wcd-common's component bind sets the RX device's runtime PM up;
+	 * this device is the component master and never runs that callback,
+	 * so do the same for it here.
+	 */
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret)
+		return ret;
+
+	return component_master_add_with_match(dev, &wcd9378_comp_ops, match);
+}
+
+void wcd9378_tx_master_remove(struct device *dev)
+{
+	struct wcd9378_priv *wcd9378 = wcd9378_dev_priv(dev);
+
+	component_master_del(dev, &wcd9378_comp_ops);
+
+	mutex_destroy(&wcd9378->micb_lock);
+	mutex_destroy(&wcd9378->sys_usage_lock);
+}
diff --git a/sound/soc/codecs/wcd9378.h b/sound/soc/codecs/wcd9378.h
new file mode 100644
index 000000000000..34b905d094ec
--- /dev/null
+++ b/sound/soc/codecs/wcd9378.h
@@ -0,0 +1,324 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026, Jorijn van der Graaf
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ * Register map for the Qualcomm WCD9378 audio codec.
+ *
+ * The codec exposes its control registers in the SoundWire SDCA control
+ * address space (bit 30 set, SDCA function number in bits 25:22), accessed
+ * through the TX SoundWire slave. The analog core registers (function 0,
+ * implementation-defined region at +0x180000) are layout-compatible with
+ * the WCD937x family; on top of that the chip adds SDCA functions
+ * (SmartMIC0/1/2, SmartJACK, SmartAMP) whose sequencers drive the analog
+ * power-up autonomously.
+ */
+
+#ifndef __WCD9378_H__
+#define __WCD9378_H__
+
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc.h>
+
+/* SDCA function 0 (extension unit): device identity */
+#define WCD9378_FUNC_EXT_ID_0			0x40000048
+#define WCD9378_FUNC_EXT_ID_1			0x40000049
+#define WCD9378_FUNC_EXT_VER			0x40000050
+#define WCD9378_FUNC_STAT			0x40080000
+
+/*
+ * FUNC_STAT sticky (write-1-to-clear) bits are everything except the
+ * live FUNCTION_BUSY flag, as in sound/soc/sdca.
+ */
+#define WCD9378_FUNC_STAT_STICKY_MASK		((u8)~SDCA_CTL_ENTITY_0_FUNCTION_BUSY)
+#define WCD9378_DEV_MANU_ID_0			0x40100060
+#define WCD9378_DEV_MANU_ID_1			0x40100061
+#define WCD9378_DEV_PART_ID_0			0x40100068
+#define WCD9378_DEV_PART_ID_1			0x40100069
+#define WCD9378_DEV_VER				0x40100070
+
+/* Analog core (WCD937x-compatible layout), function 0 + 0x180000 */
+#define WCD9378_ANA_PAGE			0x40180000
+#define WCD9378_ANA_BIAS			0x40180001
+#define WCD9378_ANA_BIAS_ANALOG_BIAS_EN		BIT(7)
+#define WCD9378_ANA_BIAS_PRECHRG_EN		BIT(6)
+#define WCD9378_ANA_RX_SUPPLIES			0x40180008
+#define WCD9378_ANA_HPH				0x40180009
+#define WCD9378_ANA_TX_CH1			0x4018000e
+#define WCD9378_ANA_TX_CH2			0x4018000f
+#define WCD9378_ANA_TX_CH2_HPF1_INIT		BIT(6)
+#define WCD9378_ANA_TX_CH2_HPF2_INIT		BIT(5)
+#define WCD9378_ANA_TX_CH3			0x40180010
+#define WCD9378_ANA_TX_CH3_HPF			0x40180011
+#define WCD9378_ANA_TX_CH3_HPF3_INIT		BIT(6)
+#define WCD9378_ANA_MICB1			0x40180022
+#define WCD9378_ANA_MICB2			0x40180023
+#define WCD9378_ANA_MICB2_RAMP			0x40180024
+#define WCD9378_ANA_MICB2_RAMP_SHIFT_CTL_MASK	GENMASK(4, 2)
+#define WCD9378_ANA_MICB2_RAMP_EN		BIT(7)
+#define WCD9378_ANA_MICB3			0x40180025
+#define WCD9378_BIAS_VBG_FINE_ADJ		0x40180029
+#define WCD9378_MBHC_CTL_SPARE_1		0x40180058
+#define WCD9378_MICB1_TEST_CTL_2		0x4018006c
+#define WCD9378_MICB2_TEST_CTL_2		0x4018006f
+#define WCD9378_MICB3_TEST_CTL_2		0x40180072
+#define WCD9378_TX_COM_TXFE_DIV_CTL		0x4018007b
+#define WCD9378_TX_COM_TXFE_DIV_SEQ_BYPASS	BIT(7)
+/* Class-H supply control, driven by wcd-clsh-v2 */
+#define WCD9378_CLASSH_MODE_2			0x40180098
+#define WCD9378_CLASSH_MODE_3			0x40180099
+#define WCD9378_FLYBACK_VNEG_CTRL_1		0x401800a5
+#define WCD9378_FLYBACK_VNEG_CTRL_4		0x401800a8
+#define WCD9378_FLYBACK_VNEGDAC_CTRL_2		0x401800af
+#define WCD9378_RX_BIAS_HPH_LOWPOWER		0x401800bf
+#define WCD9378_RX_BIAS_FLYB_BUFF		0x401800c7
+#define WCD9378_HPH_PA_CTL1			0x401800d1
+#define WCD9378_HPH_RDAC_CLK_CTL1		0x401800d9
+#define WCD9378_SLEEP_CTL			0x40180103
+#define WCD9378_SLEEP_CTL_BG_CTL_MASK		GENMASK(3, 1)
+#define WCD9378_SLEEP_CTL_BG_EN			BIT(7)
+#define WCD9378_SLEEP_CTL_LDOL_BG_SEL		BIT(6)
+#define WCD9378_TX_NEW_CH12_MUX			0x4018012e
+#define WCD9378_TX_NEW_CH12_MUX_CH1_SEL_MASK	GENMASK(2, 0)
+#define WCD9378_TX_NEW_CH12_MUX_CH2_SEL_MASK	GENMASK(5, 3)
+#define WCD9378_TX_NEW_CH34_MUX			0x4018012f
+#define WCD9378_TX_NEW_CH34_MUX_CH3_SEL_MASK	GENMASK(2, 0)
+#define WCD9378_HPH_RDAC_GAIN_CTL		0x40180132
+#define WCD9378_HPH_RDAC_HD2_CTL_L		0x40180133
+#define WCD9378_HPH_RDAC_HD2_CTL_R		0x40180136
+#define WCD9378_HPH_NEW_INT_PA_MISC2		0x40180138
+#define WCD9378_HPH_RDAC_TIMER1			0x4018013a
+#define WCD9378_CP_CP_DTOP_CTRL_14		0x4018016a
+
+/* Digital page */
+#define WCD9378_TOP_CLK_CFG			0x40180407
+#define WCD9378_CDC_COMP_CTL_0			0x40180414
+#define WCD9378_CDC_COMP_CTL_0_HPHR_COMP_EN	BIT(0)
+#define WCD9378_CDC_COMP_CTL_0_HPHL_COMP_EN	BIT(1)
+#define WCD9378_CDC_ANA_TX_CLK_CTL		0x40180417
+#define WCD9378_CDC_ANA_TXSCBIAS_CLK_EN		BIT(0)
+#define WCD9378_CDC_HPH_GAIN_CTL		0x4018044e
+#define WCD9378_CDC_HPH_GAIN_CTL_HPHL_RX_EN	BIT(2)
+#define WCD9378_CDC_HPH_GAIN_CTL_HPHR_RX_EN	BIT(3)
+#define WCD9378_CDC_AMIC_CTL			0x4018045a
+#define WCD9378_PDM_WD_CTL0			0x40180465
+#define WCD9378_PDM_WD_CTL1			0x40180466
+#define WCD9378_PDM_WD_CTL2			0x40180467
+#define WCD9378_EFUSE_REG_16			0x401804c0
+#define WCD9378_EFUSE_REG_29			0x401804cd
+#define WCD9378_PLATFORM_CTL			0x401804f0
+
+/* Sequencer block (SEQR) */
+#define WCD9378_SYS_USAGE_CTRL			0x40180501
+#define WCD9378_SYS_USAGE_CTRL_MASK		GENMASK(3, 0)
+#define WCD9378_HPH_UP_T0			0x40180510
+#define WCD9378_HPH_UP_T7			0x40180517
+#define WCD9378_HPH_UP_T9			0x40180519
+#define WCD9378_HPH_DN_T0			0x4018051b
+#define WCD9378_HPH_DN_T1			0x4018051c
+#define WCD9378_SEQ_TX0_STAT			0x40180592
+#define WCD9378_SEQ_TX1_STAT			0x40180593
+#define WCD9378_SEQ_TX2_STAT			0x40180594
+#define WCD9378_MICB_REMAP_TABLE_VAL_3		0x401805a3
+#define WCD9378_MICB_REMAP_TABLE_VAL_4		0x401805a4
+#define WCD9378_MICB_REMAP_TABLE_VAL_5		0x401805a5
+#define WCD9378_SM0_MB_SEL			0x401805b0
+#define WCD9378_SM1_MB_SEL			0x401805b1
+#define WCD9378_SM2_MB_SEL			0x401805b2
+#define WCD9378_SM_MB_SEL_MASK			GENMASK(1, 0)
+#define WCD9378_MB_PULLUP_EN			0x401805b3
+
+/* SmartAMP SDCA function */
+#define WCD9378_SMP_AMP_FUNC_STAT		0x40880000
+#define WCD9378_SMP_AMP_FUNC_ACT		0x40880008
+
+/* SmartJACK SDCA function (hosts ADC2 when fed from AMIC2, and HPH PDE47) */
+#define WCD9378_CMT_GRP_MASK			0x40c00008
+#define WCD9378_FU42_MUTE_CH1			0x40c00309
+#define WCD9378_FU42_MUTE_CH2			0x40c0030a
+#define WCD9378_FU42_CH_VOL_CH1			0x40c00311
+#define WCD9378_FU42_CH_VOL_CH2			0x40c00312
+/*
+ * Two bits of an SDCA control address select how the control is reached:
+ * "Next" addresses the shadow copy that the following bank switch commits,
+ * and "MBQ" addresses the high byte of a multi-byte control. Channel Volume
+ * is a 16-bit value, so its high byte needs both bits set and its low byte
+ * only Next.
+ */
+#define WCD9378_CN_ENABLE_MASK			0x4000
+#define WCD9378_MBQ_ENABLE_MASK			0x2000
+#define WCD9378_FU42_MUTE_CH1_CN	(WCD9378_FU42_MUTE_CH1 | WCD9378_CN_ENABLE_MASK)
+#define WCD9378_FU42_MUTE_CH2_CN	(WCD9378_FU42_MUTE_CH2 | WCD9378_CN_ENABLE_MASK)
+#define WCD9378_FU42_CH_VOL_CH1_MSB	(WCD9378_FU42_CH_VOL_CH1 | WCD9378_CN_ENABLE_MASK | \
+					 WCD9378_MBQ_ENABLE_MASK)
+#define WCD9378_FU42_CH_VOL_CH1_LSB	(WCD9378_FU42_CH_VOL_CH1 | WCD9378_CN_ENABLE_MASK)
+#define WCD9378_FU42_CH_VOL_CH2_MSB	(WCD9378_FU42_CH_VOL_CH2 | WCD9378_CN_ENABLE_MASK | \
+					 WCD9378_MBQ_ENABLE_MASK)
+#define WCD9378_FU42_CH_VOL_CH2_LSB	(WCD9378_FU42_CH_VOL_CH2 | WCD9378_CN_ENABLE_MASK)
+/*
+ * Channel Volume is a signed Q7.8 number of dB, so a step of 0x180 is
+ * -1.5dB. The control runs from 0 (-30dB) to 20 (0dB, the reset value).
+ */
+#define WCD9378_HPH_VOL_STEP			0x180
+#define WCD9378_HPH_VOL_STEPS			20
+#define WCD9378_IT41_USAGE			0x40c000a0
+#define WCD9378_SMP_JACK_IT31_MICB		0x40c00798
+#define WCD9378_SMP_JACK_IT31_USAGE		0x40c007a0
+#define WCD9378_SMP_JACK_PDE34_REQ_PS		0x40c00808
+#define WCD9378_PDE47_REQ_PS			0x40c00488
+#define WCD9378_SMP_JACK_FUNC_STAT		0x40c80000
+#define WCD9378_SMP_JACK_FUNC_ACT		0x40c80008
+#define WCD9378_SMP_JACK_PDE34_ACT_PS		0x40c80800
+#define WCD9378_PDE47_ACT_PS			0x40c80480
+
+/* SmartMIC0/1/2 SDCA functions (ADC1/ADC2/ADC3 sequencers) */
+#define WCD9378_SMP_MIC_BASE(n)			(0x41000000 + (n) * 0x400000)
+#define WCD9378_SMP_MIC_IT11_MICB(n)		(WCD9378_SMP_MIC_BASE(n) + 0x98)
+#define WCD9378_SMP_MIC_IT11_USAGE(n)		(WCD9378_SMP_MIC_BASE(n) + 0xa0)
+#define WCD9378_SMP_MIC_PDE11_REQ_PS(n)		(WCD9378_SMP_MIC_BASE(n) + 0x108)
+#define WCD9378_SMP_MIC_OT10_USAGE(n)		(WCD9378_SMP_MIC_BASE(n) + 0x3a0)
+#define WCD9378_SMP_MIC_FUNC_STAT(n)		(WCD9378_SMP_MIC_BASE(n) + 0x80000)
+#define WCD9378_SMP_MIC_FUNC_ACT(n)		(WCD9378_SMP_MIC_BASE(n) + 0x80008)
+#define WCD9378_SMP_MIC_PDE11_ACT_PS(n)		(WCD9378_SMP_MIC_BASE(n) + 0x80100)
+
+#define WCD9378_MAX_REGISTER			0x41900070
+
+/*
+ * Raw (16-bit, non-paged) Qualcomm slave SCP registers. Below the
+ * SoundWire paging threshold (SDW_REG_NO_PAGE, 0x8000), so they are
+ * reachable through the same 32-bit paged regmap as the SDCA registers
+ * above -- the SoundWire core only pages addresses at or above that
+ * threshold. SDCA interrupt mask/status/type configuration.
+ */
+#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_1	0xf4
+#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_2	0xf8
+#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_3	0xfc
+#define WCD9378_SWRS_SCP_SDCA_INTMASK_1		0x5c
+#define WCD9378_SWRS_SCP_SDCA_INTMASK_2		0x5d
+#define WCD9378_SWRS_SCP_SDCA_INTMASK_3		0x5e
+#define WCD9378_SWRS_SCP_SDCA_INTSTAT_1		0x58
+#define WCD9378_SWRS_SCP_SDCA_INTSTAT_2		0x59
+#define WCD9378_SWRS_SCP_SDCA_INTSTAT_3		0x5a
+
+/* ITxx_USAGE ADC mode values */
+#define WCD9378_ADC_USAGE_HIFI			0x01
+#define WCD9378_ADC_USAGE_LO_HIF		0x02
+#define WCD9378_ADC_USAGE_NORMAL		0x03
+#define WCD9378_ADC_USAGE_LP			0x05
+#define WCD9378_ADC_USAGE_OFF			0x00
+
+/* ITxx_MICB usage values */
+#define WCD9378_MICB_USAGE_OFF			0x00
+#define WCD9378_MICB_USAGE_PULL_DOWN		0x01
+#define WCD9378_MICB_USAGE_1P2V			0x02
+#define WCD9378_MICB_USAGE_1P8V_OR_PULLUP	0x03
+#define WCD9378_MICB_USAGE_2P5V			0x04
+#define WCD9378_MICB_USAGE_2P75V		0x05
+#define WCD9378_MICB_USAGE_2P2V			0xf0
+#define WCD9378_MICB_USAGE_2P7V			0xf1
+#define WCD9378_MICB_USAGE_2P8V			0xf2
+#define WCD9378_MICB_USAGE_REMAP_TABLE_3	0xf3
+#define WCD9378_MICB_USAGE_REMAP_TABLE_4	0xf4
+#define WCD9378_MICB_USAGE_REMAP_TABLE_5	0xf5
+
+/* PDExx_REQ_PS power states */
+#define WCD9378_PDE_PS0_ON			0x00
+#define WCD9378_PDE_PS3_OFF			0x03
+
+#define WCD9378_MAX_MICBIAS			3
+#define WCD9378_MAX_SWR_CH_IDS			15
+
+enum wcd9378_tx_sdw_ports {
+	WCD9378_ADC_1_PORT = 1,
+	WCD9378_ADC_2_PORT,
+	WCD9378_ADC_3_PORT,
+	WCD9378_DMIC_0_1_MBHC_PORT,
+	WCD9378_DMIC_2_5_PORT,
+	WCD9378_MAX_TX_SWR_PORTS = WCD9378_DMIC_2_5_PORT,
+};
+
+enum wcd9378_rx_sdw_ports {
+	WCD9378_HPH_PORT = 1,
+	WCD9378_CLSH_PORT,
+	WCD9378_COMP_PORT,
+	WCD9378_LO_PORT,
+	WCD9378_DSD_PORT,
+	WCD9378_MAX_SWR_PORTS = WCD9378_DSD_PORT,
+};
+
+enum wcd9378_tx_sdw_channels {
+	WCD9378_ADC1,
+	WCD9378_ADC2,
+	WCD9378_ADC3,
+	WCD9378_DMIC0,
+	WCD9378_DMIC1,
+	WCD9378_MBHC,
+	WCD9378_DMIC2,
+	WCD9378_DMIC3,
+	WCD9378_DMIC4,
+	WCD9378_DMIC5,
+};
+
+enum wcd9378_rx_sdw_channels {
+	WCD9378_HPH_L,
+	WCD9378_HPH_R,
+	WCD9378_CLSH,
+	WCD9378_COMP_L,
+	WCD9378_COMP_R,
+	WCD9378_LO,
+	WCD9378_DSD_L,
+	WCD9378_DSD_R,
+};
+
+enum {
+	WCD9378_IRQ_MBHC_BUTTON_PRESS_DET = 0,
+	WCD9378_IRQ_MBHC_BUTTON_RELEASE_DET,
+	WCD9378_IRQ_MBHC_ELECT_INS_REM_DET,
+	WCD9378_IRQ_MBHC_ELECT_INS_REM_LEG_DET,
+	WCD9378_IRQ_MBHC_SW_DET,
+	WCD9378_IRQ_HPHR_OCP_INT,
+	WCD9378_IRQ_HPHR_CNP_INT,
+	WCD9378_IRQ_HPHL_OCP_INT,
+	WCD9378_IRQ_HPHL_CNP_INT,
+	WCD9378_IRQ_EAR_CNP_INT,
+	WCD9378_IRQ_EAR_SCD_INT,
+	WCD9378_IRQ_AUX_CNP_INT,
+	WCD9378_IRQ_AUX_SCD_INT,
+	WCD9378_IRQ_HPHL_PDM_WD_INT,
+	WCD9378_IRQ_HPHR_PDM_WD_INT,
+	WCD9378_IRQ_AUX_PDM_WD_INT,
+	WCD9378_IRQ_LDORT_SCD_INT,
+	WCD9378_IRQ_MBHC_MOISTURE_INT,
+	WCD9378_IRQ_HPHL_SURGE_DET_INT,
+	WCD9378_IRQ_HPHR_SURGE_DET_INT,
+	WCD9378_IRQ_SAPU_PROT_MODE_CHG,
+	WCD9378_NUM_IRQS,
+};
+
+struct wcd9378_priv;
+struct wcd9378_sdw_priv {
+	struct sdw_slave *sdev;
+	struct sdw_stream_config sconfig;
+	struct sdw_stream_runtime *sruntime;
+	struct sdw_port_config port_config[WCD9378_MAX_SWR_PORTS];
+	const struct wcd_sdw_ch_info *ch_info;
+	bool port_enable[WCD9378_MAX_SWR_CH_IDS];
+	unsigned int master_channel_map[SDW_MAX_PORTS];
+	int active_ports;
+	bool is_tx;
+	struct wcd9378_priv *wcd9378;
+	struct irq_domain *slave_irq;
+	struct regmap *regmap;
+};
+
+int wcd9378_sdw_hw_params(struct wcd9378_sdw_priv *wcd,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct snd_soc_dai *dai);
+
+int wcd9378_tx_master_probe(struct device *dev, struct wcd9378_sdw_priv *wcd);
+void wcd9378_tx_master_remove(struct device *dev);
+
+#endif /* __WCD9378_H__ */

-- 
2.34.1

