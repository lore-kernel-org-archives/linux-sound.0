Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7C423780
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898515; cv=none; b=jnQsoGJSdC/yQncTv5Ngb4zsEqOkMfB4Rk1YJlQpgZr45tGMoX+cFG23cNbW7hXuCctPp2Z8B5eM6bJJCIJsAhrWgAzNm13GUaAh1H8+/uXbQkEVQ2qJjPxZ1j1rpcHsRDdr6OVqub4JZ5bqJCk1phrJYbpbiJVqae3qp+ybTJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898515; c=relaxed/simple;
	bh=C6kQA0u8dFmjiOTbOj/szcTJ7oZVTadFFjhW11dhMhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okYomiPsQc7w6BtBs6WnDAfFYSc5iP047Lcgys2GZ6eN55d+XHoKWjzS+sF8Jx6L5UpmZAVuVyabSxf5aifUrbbj8nyGFBZcmcodUxK2vbcs8SkWxssY6QskHgjsczQWXXoC4l+thaZcd/tiJAy7xzpbpXS1nBrAt9gjWQn/Yzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaXadsoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqkGE3fA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaXadsoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqkGE3fA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCmEkp2825655
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CRftSoVFvItus87l++yzWUXHSPN0iv7LNRluqrmJ8UQ=; b=OaXadsoUxZ5sZ0Rz
	VywFprMqFExP8uGB/BRTLoPS2aEt9XPvo2IR5VYolnGT+pZF9uJgHIqSeC8Fvfhk
	uN4HZoSonNmgN+c0ffC7m/WGEJpic4xhAXfZXo0vwC0Ux1DCPwd6t88SyBM8QA3c
	DBXnqJl29L6kUwsxNIKrpbr9dV5n1+RbkbfQdZEsc+splN8obOlnGuIfiu7k+JAu
	svSJ+YalGddJwSCPapTMoqNeaUsLd0qRfncRlmEObKTZFM18HnTsc2laYmnmcSAq
	LdYYHqU9CJ02bezh74PluO6j1ucvgUxy7SCRXMXFDvtUn3fowOgVN46PjHKZWJXE
	lnQrdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj822p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:08:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso6668961cf.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784898511; x=1785503311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRftSoVFvItus87l++yzWUXHSPN0iv7LNRluqrmJ8UQ=;
        b=QqkGE3fA4XRzjHo/LntAvuhI4kEIw95LfMGx42EfUEDZ751N+5RuGiS/IcNQIaCVij
         24pMEcUvZKElCZFqmkdnoJ2gmIk3wr0pJDab8oP3y+hRntLoQAgcHNagIrlXem15uQDv
         a/zOnhCIRHtqE+BT5bALXMZuK/jI+Oh6hGdIS3IfdYCJrXzcFJnvtv0v6eGJM1EUDdH1
         AEiRuF+JUfRhc6lmcVnhtW9sCfDMsV3Eo6SaRD7Zv3DOaB8bUp3wVuzI+0eWq+RNcHPy
         14PXBtWSo7T/UMOmgByf67clv3YeZjgrEd4USJy1OSFISS2VfGqvIrqeQ1aDt/TaRSfy
         6vFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898511; x=1785503311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRftSoVFvItus87l++yzWUXHSPN0iv7LNRluqrmJ8UQ=;
        b=aoYdyA9b+5JojxsaBOE+GM9vAim9yaOYuIhVuewD71cNfQZ3TIrfO7Se80Yt/QIK5w
         Lur0mrgxAz8d7i3EM8cOoVNLHlwhyjlY2nz5jExcTlfFpGWI2OSWKV1NG7A82jdvjgvC
         6HIyReb8p1e6+ezHQ0KJ5BfYtMYUajM0asWOhgURJn5cI3qcJipvRzYnu/0FT7M/sEQp
         75H9F4d1CkDP/CCtvp4b9isaDkJx1MLRY/KktwxnNVDpWWb+oBg8kma+xBms31pBr5Qb
         VHhsdiHDI2XzbTNaMIODfHkihd3b361mPV7s+4cHJBPMWiEQ7Iw5dr+2aFdRtDcoS74V
         avLA==
X-Gm-Message-State: AOJu0YxhI01nlvFDcYH0lG3Dsa863QtyMANOZdoved1I9Dzd/dsk1krl
	RIIINV88VYoCWkG1qBNjOCPO/Vucl/f/VYw+TZGrKa7roV3xcxZjTYRVxf6JhgHS5RVtW2IuSA1
	yg1zp0vrHQ/eiYRBOtinJgRc0Wjpbl5vrbct6y5DwlcBdUa2yooBjoBRvAI/VTRSRWlJdzHNlIg
	==
X-Gm-Gg: AR+sD13cVHanhm7qa1C8zTq6WL2b1n5DU+vyWwCsol9IJHMsxBjjOHnV6+1GpUZD+xY
	NOHSkmYwLX6OYQbJaY3hHauja4DFZdDpiLeJ8vCvgiArFWoP5l2WkIhUyeZGzc7Y6sM6pPTAkF9
	HDRE4vc0xBlEzZHoL2M0YfibWueT1JuP2lNXr+rAfTjZ5Vdby+lgIGaXQVYhwXKXcMceLD4YtdS
	2MT5IaGBTDIFHp1XAufYnAwO15+WqlUc0W/NhCmITiXxy0nADUnWXkGkTfMsL0ZoDCRazkNJ3/T
	qoHtOtLyXi9NG89odHmgvrWWQCPewk8t9Ju81ooMLD/Sy1qRtpDCf8T7yg80vuUmwfqsf1I0du2
	O3Z8ZcXMl
X-Received: by 2002:ac8:7f42:0:b0:51c:12bf:d4a7 with SMTP id d75a77b69052e-5283df1079cmr73441061cf.45.1784898511224;
        Fri, 24 Jul 2026 06:08:31 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:51c:12bf:d4a7 with SMTP id d75a77b69052e-5283df1079cmr73440321cf.45.1784898510460;
        Fri, 24 Jul 2026 06:08:30 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm64921045e9.10.2026.07.24.06.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:08:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:08:19 +0300
Subject: [PATCH v2 2/2] ASoC: qcom: x1e80100: Allow userspace WSA RX chmap
 override
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-2-2ca3c1250018@oss.qualcomm.com>
References: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
In-Reply-To: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=8327;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=C6kQA0u8dFmjiOTbOj/szcTJ7oZVTadFFjhW11dhMhc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqY2PGFrvxzqkNaDJT6ibLEfsIj7PCotzC8iVg/
 31WPKHuuyuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamNjxgAKCRAbX0TJAJUV
 VnCUD/9MBA4mfc+Ud8GfCziQlrnAPjIU2aIASNzwZl7YXN/5DmLMwde5J+XaSpk7KvR1WYpJwq1
 D0DTNKbjmehh1Ug80H3dG98b5aH5yTnytrIYWrK6KVfBFumSVKkJEl7O1vEn/IWYdJ4E7ugQ1DY
 hQz7MKDRqR3OTFCb3GO0HTc54UiSOXkppJVUG0xSsarUs9VoBOnXX7geBeplrwWtSkcTTDkuJK2
 AtIgjdIhLrUXomIkMV2WAygXJtWJY6qtI2RAEGZm57knVrcfk1M+8hATbgp0sTXzSpfCeELZhar
 yltsqe4UOzmQSaIBv/jCz6lhf8PSlVoWaWj77lpJ7Z91aIV+RX3H9pIOG4+zeiXjMJdtMLVIWfK
 WPOYRfXDX1cstuKx12brDcwjtJnrZuPrZzU9vEYkA7sc+unS/D1RhVFNr68gSXCHgJoywVG1cjl
 6rE0ebOidatxPMzRGpxsbkQ9RrxrIRB/3i9dpWaX/UtjEMBG8RNP8biM7m9pZkd4qdeBxUFGtt1
 S/6u+qJh3U1c0f+w/enHpniedK1cXt8H88RDIZfRAoYMM4SAz94GC8oRD7EzBnyWaT/2c6Z2iEn
 7+1aU9fpCT1n6BCF2ChX6rInSmtXQq5WD2STCq9BQVH69QKh26P7CIrYVwxm6gYeAamcf2YscHk
 /CsLfaeE2gcvdTw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a6363d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yfAaYSGhh6VJTT24xRUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfXzEs20kzfUw86
 yV45OFgJwiE/GzJFzwx+M0GGQAxXXGbDKQEU7pO2RW5+/Y4zP+ScClHcAF/d2EYwSo293zsnvuw
 N+iU4F/JCi6TrkQG10LHAfhpAKjX32Yjnuv1B3YRIUAyphPGkmpm8SMuj83t3rqqH86L7Igs3ro
 AhdpG47cR2nxol/Eq6KmbZnnw8n4K1+Br/21BFmgPd6UMH8JPxtk1bai2V5/s3vFtwlJhlC4vSP
 +a2c0f8YMWMZ3YJ8318wSMjz0dXPBtCQDIaQPLfmtBqpmjdwIUNxeNl9/Ml+vcP0uSZ5Ab9KXQ1
 lmoGakzfFPIHIk6GO3npCI17KpG0p13wn45ra6v1pW28XMlhx9Wm0nwnpPc9yy759wWvVERCfYd
 RpKga5BOCp+ze3GBB/qr99VUzdLZx6aQg+D8s7B9dFEMC5lGzCyWz7wYu89yD6AqWlBJ7nxBEwf
 H386g/jJORiNhYihwxw==
X-Proofpoint-ORIG-GUID: she6qRn1VTgWlfsjhtkw6J6kKg4ZHsrU
X-Proofpoint-GUID: she6qRn1VTgWlfsjhtkw6J6kKg4ZHsrU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX8A5SJNBDSBFj
 CVtxDJrbinr3CaxsKNXbGi1D41DMSXWyKNgEpHPUW18Ny6fQ7fVOOANy6keS0MBSsJCHVR/0/2A
 g+G2MSYwANbk5R6pE0yh66K8UdvrZHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240119

The WSA RX slot mapping is currently computed entirely from the channel
count in .prepare() and pushed unconditionally via
snd_soc_dai_set_channel_map(). Userspace has no way to express a
different channel map, so any map defined in UCM is ignored.

Add writable WSA Playback Channel Map controls for the WSA RX backend
ports. Store the userspace-selected SNDRV_CHMAP_* map per AFE port,
translate it to Q6 PCM_CHANNEL_* slots at .prepare() time, and keep the
previous default mapping when userspace has not provided a complete map.

The WSA DAI links are backend no_pcm links, so there is no PCM instance
available when the card is initialized. Register card-level controls
instead, which keeps the maps visible to UCM before stream startup while
still storing the selected map per WSA backend port. Expose the standard
ALSA channel maps through the controls' TLV data.

Allow up to six WSA channels for Glymur, and give the controls
WSA-specific names so they are distinguishable from other channel map
controls on the same card.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 182 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..b3d10410b2d7 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -5,22 +5,155 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/uaccess.h>
 #include <sound/pcm.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 #include "common.h"
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
+#define X1E80100_WSA_MAX_CHANNELS	6
+
 struct x1e80100_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
+	unsigned int user_chmap[AFE_PORT_MAX][X1E80100_WSA_MAX_CHANNELS];
+};
+
+static int x1e80100_chmap_ctl_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(card);
+	unsigned int dai_id = kcontrol->private_value;
+	unsigned int *map = data->user_chmap[dai_id];
+	int i;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		ucontrol->value.integer.value[i] = map[i];
+
+	return 0;
+}
+
+static int x1e80100_chmap_ctl_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(card);
+	unsigned int dai_id = kcontrol->private_value;
+	unsigned int *map = data->user_chmap[dai_id];
+	bool changed = false;
+	int i;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
+		unsigned int pos = ucontrol->value.integer.value[i];
+
+		if (pos && qcom_snd_chmap_to_q6(pos) < 0)
+			return -EINVAL;
+
+		if (map[i] != pos)
+			changed = true;
+	}
+
+	if (!changed)
+		return 0;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		map[i] = ucontrol->value.integer.value[i];
+
+	return 1;
+}
+
+static int x1e80100_chmap_ctl_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = X1E80100_WSA_MAX_CHANNELS;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = SNDRV_CHMAP_LAST;
+
+	return 0;
+}
+
+static int x1e80100_chmap_ctl_tlv(struct snd_kcontrol *kcontrol,
+				  int op_flag, unsigned int size,
+				  unsigned int __user *tlv)
+{
+	const struct snd_pcm_chmap_elem *map;
+	unsigned int __user *dst;
+	int c, count = 0;
+
+	if (size < 8)
+		return -ENOMEM;
+	if (put_user(SNDRV_CTL_TLVT_CONTAINER, tlv))
+		return -EFAULT;
+	size -= 8;
+	dst = tlv + 2;
+
+	for (map = snd_pcm_std_chmaps; map->channels; map++) {
+		int chs_bytes = map->channels * 4;
+
+		if (map->channels > X1E80100_WSA_MAX_CHANNELS)
+			continue;
+		if (size < 8)
+			return -ENOMEM;
+		if (put_user(SNDRV_CTL_TLVT_CHMAP_FIXED, dst) ||
+		    put_user(chs_bytes, dst + 1))
+			return -EFAULT;
+		dst += 2;
+		size -= 8;
+		count += 8;
+
+		if (size < chs_bytes)
+			return -ENOMEM;
+		size -= chs_bytes;
+		count += chs_bytes;
+		for (c = 0; c < map->channels; c++) {
+			if (put_user(map->map[c], dst))
+				return -EFAULT;
+			dst++;
+		}
+	}
+
+	if (put_user(count, tlv + 1))
+		return -EFAULT;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new x1e80100_wsa_chmap_controls[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "WSA Playback Channel Map",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
+		.info = x1e80100_chmap_ctl_info,
+		.get = x1e80100_chmap_ctl_get,
+		.put = x1e80100_chmap_ctl_put,
+		.tlv.c = x1e80100_chmap_ctl_tlv,
+		.private_value = WSA_CODEC_DMA_RX_0,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "WSA2 Playback Channel Map",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+			  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK,
+		.info = x1e80100_chmap_ctl_info,
+		.get = x1e80100_chmap_ctl_get,
+		.put = x1e80100_chmap_ctl_put,
+		.tlv.c = x1e80100_chmap_ctl_tlv,
+		.private_value = WSA_CODEC_DMA_RX_1,
+	},
 };
 
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
@@ -92,9 +225,10 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+static int x1e80100_snd_default_wsa_slots(unsigned int *ch_map,
+					  unsigned int channels)
 {
-	switch (num) {
+	switch (channels) {
 	case 1:
 		ch_map[0] = PCM_CHANNEL_FC;
 		break;
@@ -113,6 +247,14 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 		ch_map[2] = PCM_CHANNEL_FR;
 		ch_map[3] = PCM_CHANNEL_RB;
 		break;
+	case 6:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LB;
+		ch_map[3] = PCM_CHANNEL_RB;
+		ch_map[4] = PCM_CHANNEL_FC;
+		ch_map[5] = PCM_CHANNEL_LFE;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -120,19 +262,49 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 	return 0;
 }
 
+static int x1e80100_snd_build_rx_slot(struct x1e80100_snd_data *data,
+				      unsigned int dai_id,
+				      unsigned int channels,
+				      unsigned int *rx_slot)
+{
+	unsigned int *user = data->user_chmap[dai_id];
+	unsigned int i, set = 0;
+
+	if (channels > X1E80100_WSA_MAX_CHANNELS)
+		return -EINVAL;
+
+	for (i = 0; i < channels; i++)
+		if (user[i])
+			set++;
+
+	if (set != channels)
+		return x1e80100_snd_default_wsa_slots(rx_slot, channels);
+
+	for (i = 0; i < channels; i++) {
+		int q6 = qcom_snd_chmap_to_q6(user[i]);
+
+		if (q6 < 0)
+			return q6;
+		rx_slot[i] = q6;
+	}
+
+	return 0;
+}
+
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int channels = substream->runtime->channels;
-	unsigned int rx_slot[4];
+	unsigned int rx_slot[X1E80100_WSA_MAX_CHANNELS];
 	int ret;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
-		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		ret = x1e80100_snd_build_rx_slot(data, cpu_dai->id,
+						 channels, rx_slot);
 		if (ret)
 			return ret;
 
@@ -203,6 +375,8 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 		return ret;
 
 	card->driver_name = of_device_get_match_data(dev);
+	card->controls = x1e80100_wsa_chmap_controls;
+	card->num_controls = ARRAY_SIZE(x1e80100_wsa_chmap_controls);
 	x1e80100_add_be_ops(card);
 
 	return devm_snd_soc_register_card(dev, card);

-- 
2.54.0

