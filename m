Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5C381E98
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763752; cv=none; b=LwByDN2+wZEQPCI6kx9Ci6pI1FoZzuoIjfwYFVdTvIInI0Dx3YPLDsz3gEVKJ35Ede3jvSvbpaPf5u5rbCdPLfq8zbo1yZ1unX/mA9DAVWgZTLj4CuIdU/bV/ywMgsKptW04G91CwROyw0xk+LgxBm6fCv3/5du5blHeAVn7N+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763752; c=relaxed/simple;
	bh=tPvnlDdMdba2ZwpSe8Kq7c4l3nlqeqxGNngURpHZjWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4ARM0CRFj7TpiGrJ6Xvyk5DA+CbNWo5ouHt1BIK+oZFLGL+TqzJd1qpze6YHNqCtWEkVcWACya3/DG9gWCTRn9lt/YT8zpY/RBl3cjmhUNgLi+AGtYX/kNjpCpyMRDxe2ppk2u80yuj0BSJB1Xk+HuLOA5bg9goJrZ4To8ewJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYwAFqNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVwuJhi4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYwAFqNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVwuJhi4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnvQp2176021
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/nHfyshFw50BKNXfTXZOCtPnmEnp0tvhe1+
	YfoEBm18=; b=AYwAFqNMcWJOYs3nXjKPgPZLEQwkF+Cny3Gjun2i7ASYLfVonf+
	8AxgTQ590RCKWg1BbGyVRy05QTBrF+1unEqlG3dp+fRY9APD8xDjgyXGTW3q/53k
	WglSdngGuqofPAFuV5BVNSVebChR6h08t43oNQOtpC/d/HHxahvSlMPFwbbZ+9Vt
	zGjXIwaNvhebFTaeedgHswlv9aHB67oRLZYppf/Qw9l8VDS8TfIMCitMCIJsIP5y
	70T/yobmWtSz/eRO8iaYAL2BVu3Csl/3Lch4QcteqdCstm6kDWkT+omzi28j9rHS
	iTh3aCI6hz6BHF9/O7CBrCczYKYMdIKxvig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm12f03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso295471cf.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 16:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763749; x=1785368549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nHfyshFw50BKNXfTXZOCtPnmEnp0tvhe1+YfoEBm18=;
        b=MVwuJhi4l2r7MTGuLSXEiqSORQuRtUi6igaYHvIX4ml35EftNLCD1WAfCGwJqQMtEl
         fKK4qhuBRAXHGxM3Zylw+YUGb4KpCza/xepxiUzs9LGubeBlSLZskGf1hhEyeuN7pKVw
         dVGbqCryUA0uMZRC9pAfLM+fWIptU4/NwtSHa1i4JlMDqENJoK95o60yjj6qluD/a3hO
         RhlAbn6+zZuAj4kHeQgSWDeEUlcBo5Q58Kr3jfDiAHW8BOLXqV13R8POMk7NjOykmtSo
         XYkGlbu5CgCzgOpgoiDWEVfLssYO3tNKLVKtIVW21oukZSm25pL+hIJuMeaeCykz8BjL
         mpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763749; x=1785368549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nHfyshFw50BKNXfTXZOCtPnmEnp0tvhe1+YfoEBm18=;
        b=OWXerklIQ5XZywIdEumZ5DUzBqfAW3R8JgIne5X4gR39tHV6SL6MIRYr2PC2jvZOo0
         nh+z33/xGP62nn0qsjlH/HWrEusqW4tD3XE5mrVLC/fQM1TakTSTxqF6rhsAwB63r54c
         JjlMPVnu+9b4nqHu/4+nruUcZZEtl2P+I21JEoFpWo2eSsVH97zZvTA6kFyIjkA1a6b6
         +w9Qld8mfaunZ/EnY4nGqVQ7r0/LXy0b5b+4ZSsm0f9KC4A6XBPdjzzBaP2FZ+WeMtDR
         wgDORt4U3lgiR6nwbCPaKGGKaDohZ++1BtuhxY2wrZShtXB37Ou8Tz6/RvoAy+TKu3ae
         cY5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpQetR8KyDzGlujaUHT/pzH40Z0oLsJ4RU36DaHqSI/C1RQdmTsJSkC/XtxFAMQKe6/uSnW2XwH3CQzsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUM0uiXWfH+yoDlRgW/s+mugjxLZMkFMIw324/QfXaXaOJ91BK
	4bxHDLfnxArgUGxgQFeVg59TOmYtLR9ybNdzt/uHy9iWs3y9j7ZFSkjNGc2/bBfgAxkX971tOJE
	qDsjRYd1Is8l3MU+uGEBT1Gmjtm6RC/D6161+gMFnLGA8lWEUdtG3GxzLBHU1Y37IUg==
X-Gm-Gg: AR+sD11S7fV0baQGiqjOKMyGE3P1pOjHjPhsWU6KRBpTkLuaTKo4q3Yu4bJNTLGDJQO
	47EiKJR15NJHPW9sB29a1+tjBOOpkGuy2NQZhC/M8kwucqcmp0Tt3TtlYPeebk6oKvEWUGe+yEO
	nrxPmpQD0i8XCxUutv9N3EPTWGaw/Lz9mA1ln5il34PtJpUCd7SiXCF3zbS8BTj2aaa5L/zrAM7
	cNRni5rA7vDorI/N6P8xgeJ/l3C49nffSOKIGvGhWhGlVORObKKGWgrD6VEDrLgSbYoNQ3ab2Vv
	qYSm8L/YKXK8OcrS9MtiTVO9RiU6Gsd0S/1F0opC6Hz5ViXyIXrBz5Vc5/Dz66XHTbFauRlkDUX
	zqeoVEaCiwT1rZA==
X-Received: by 2002:a05:622a:30a:b0:51f:20e1:137f with SMTP id d75a77b69052e-5283de15b48mr7249161cf.19.1784763748336;
        Wed, 22 Jul 2026 16:42:28 -0700 (PDT)
X-Received: by 2002:a05:622a:30a:b0:51f:20e1:137f with SMTP id d75a77b69052e-5283de15b48mr7248901cf.19.1784763747824;
        Wed, 22 Jul 2026 16:42:27 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add Qualcomm WCD9378 (Tambora) codec
Date: Thu, 23 Jul 2026 00:42:10 +0100
Message-ID: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX1P5PPPLxcMxg
 te8bfzeISmg0qXJTfy/CcjIBWjnCK47+DxHl4cNIl4n6SByVooxPOAQl/QRa0D8e0bV+kMpltO6
 zmPer6eW6OjxInFwWKsKdaHgrGC6FmY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX8aJGn4NgbGz9
 1qDDNPlZYQeBPWC4sxv0/NurOKFZH0CbQzRnW6ARZiM+Sb0V7EGaB/FhOlG6RbvVsTIyp4YMtoK
 xvzKPFZCn/kPMjUnA6PokWW8ji70T03l1y+3aHphmL7s21FisOJkjAK9n/f7/Dg6HA9tbqJlxtZ
 FxvaiwYpBCPETTQVt196nN51fxnlWIASYsEsyJWBk4/4YrngHHum6UTzzMpJKmWv2Ar8AdeyQ7D
 6NiAPWNSL4B5PTxgDdKv2KHK4rqw+WSoxgK1UTQFkAs9o1l6nZNymMt5P9XlY+ZYY6x2X9Tnwk9
 U8tK9CQJqPaUXHT47LpRmEJVGz+cH0Z6sTVz3ofdBDHvqAppLWpFI5zVi/PL6ehDAkQWu0xRF6G
 zypo5nX5ZuR8hfXnG+ioR6xExdlZHzuPoqwz0epiHvFaWQhGKmCp8pZU62DuYPFk1HHj0EUvPOn
 NpXBATeW18WEG4Olv4g==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a615565 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OGjWj8McAAAA:8
 a=07d9gI8wAAAA:8 a=-1sRFuYLJzeE8_jXQdgA:9 a=dawVfQjAaf238kedN5IG:22
 a=UYjydHh6ynBBc6_pBLvz:22 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-GUID: ebDD6hUfBivmtrJue2cB-MookktqdhIx
X-Proofpoint-ORIG-GUID: ebDD6hUfBivmtrJue2cB-MookktqdhIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220233

Hi all,

At Linux Plumbers 2025 in the Devicetree MC I raised the "SDCA and the
classic ACPI-DT problem" [1]: MIPI SDCA is built around ACPI/DisCo
firmware descriptors, and the in-tree ASoC SDCA framework
(sound/soc/sdca/) enumerates functions, entities, controls and PDEs by
walking those tables. On ARM64 DT platforms there is no DisCo, so the
framework is unreachable and sdca codecs will not be able to use the
generic sdca drivers and duplicating.

The direction from that discussion was to let DT platforms reuse the
same class/function auxiliary driver plumbing and have codec drivers
supply the small amount of static function/entity metadata that DisCo
would otherwise carry, plus hooks for device-specific bring-up.  This
series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
SDCA codec on the Glymur CRD as the first consumer. Static table that in
part of this codec is generated from acpi tables.

About WCD9378: the same silicon ships in two very different platform
modes.  In "mobile mode" (Qualcomm phone/tablet SoCs) is enumerated as
as tx and rx device, each of which has dedicated control and data lines.
mobile mode is addressed by Jorijn's posting [2].
In "compute mode" (Qualcomm compute platforms such as Glymur / X2 Elite)
the same part is enumerated as a single standard MIPI SDCA class device
on SoundWire and is driven purely through the SDCA framework, which
is what this series covers.  Both modes share the same MIPI class ID
and, in DT, the same compatible; qcom,compute-mode selects which
driver path is taken.

Framework enablement (patches 1-6):

 * 1: hw_params fix for OT DAI upstream Input Terminals (found while
   bringing up Tambora capture).
 * 2: allow sound/soc/sdca/ to build without ACPI.
 * 3: turn sdca_class into an exported library and introduce
   struct sdca_class_hw_ops with hw_init + get_function_data, so a
   codec driver registers its own sdw_driver, supplies static function
   descriptors when there is no DisCo node, and owns regulators/reset
   at probe time.  The built-in class_sdw_driver stays for
   pure-generic parts (hw_ops = NULL).
 * 4: pde_pre_pmu / pde_post_pmu hooks in hw_ops so vendor drivers
   can stage/commit register writes around PDE PS0 transitions.
 * 5: of_xlate_dai_name that resolves sound-dai cells by entity index
   rather than positional DAI order.
 * 6: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in the class function
   driver.

First consumer (patches 7-8):

 * 7: WCD9378 SoundWire slave binding.  Compatible is shared with
   Jorijn's mobile WCD9378 posting [2]; qcom,compute-mode selects the
   SDCA/compute-mode probe path and gates the compute-only properties.
 * 8: Tambora codec driver - registers its own sdw_driver, calls into
   the class library, supplies SimpleJack + HID functions via
   get_function_data, owns supplies/reset/mic-bias in hw_init, uses
   pde_*_pmu for the FU + IT_USAGE writes the PDE sequencer needs.

RFC because patches 1-6 touch the SDCA framework, is what I
would most like feedback on.  Tested on Qualcomm Glymur CRD:
headphone playback, capture work end-to-end via the Tambora
codec over the mulit master SoundWire bus.
Platform bits (LPASS clock controller, SoundWire aggregate
controller, machine-driver DT, defconfig, ...) are held back for a
separate posting once this shape is agreed.

Next steps
==========

The most obvious follow-up is figuring out how the mobile-mode and
compute-mode WCD9378 drivers coexist under one compatible.  Jorijn's
mobile driver [2] and this compute-mode driver target the same silicon
and register the same MIPI class ID on the SoundWire bus, and today
they discriminate purely on the qcom,compute-mode DT property.  We
need to agree on a cleaner arbitration. Probably a shared
sdw_driver stub in wcd9378-common that reads the mode and dispatches
to the mobile or compute code path - so that both drivers can live in
tree without racing to bind the same slave.  I would like to line this
uip with Jorijn as a follow-up to this series. Cleanup some of the
static volume setting to a proper volume control.

Links
=====

[1] LPC 2025, Devicetree MC:
    "DeviceTrees - MIPI SoundWire Device Class for Audio (SDCA) and
     classic ACPI-DT problem"
    https://lpc.events/event/19/contributions/2024/

[2] Jorijn Rikhof, mobile-mode WCD9378 posting:
    https://lwn.net/Articles/1081648/

Thanks,
Srini

Srinivas Kandagatla (8):
  ASoC: SDCA: hw_params: program upstream Input Terminals for OT DAI
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: expose class helpers with hw_ops for non-DisCo platforms
  ASoC: SDCA: add PDE pre/post-pmu hooks to hw_ops
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function
    driver
  dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  201 +++
 include/sound/sdca.h                          |    2 +-
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1202 +++++++++++++++++
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_asoc.c                    |   84 +-
 sound/soc/sdca/sdca_class.c                   |   83 +-
 sound/soc/sdca/sdca_class.h                   |   41 +
 sound/soc/sdca/sdca_class_function.c          |   80 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_function_device.c         |    2 +-
 sound/soc/sdca/sdca_functions.c               |    4 +
 13 files changed, 1710 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c

-- 
2.53.0

