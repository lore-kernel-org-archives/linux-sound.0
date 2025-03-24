Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA7325E476
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824236; cv=none; b=Z5z55fyZq7ApiFuX6Rd9lqGnl9fY3j3ky0QgNOKViE6w5c19QQJaekhpCsEYumE3/onQULX3wPg4WlA2t2uxhnzx9il+U4K0fOnaL5P1ut+suCQHIhLAXPFReny6ObkGmGABzM1DL6yu2YlAK0C3xHmyMiYEk+AqNUTW0WH5CP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824236; c=relaxed/simple;
	bh=KH2AbP8hEOSyv2dSdRRqSFbyC0F8lwz0bs994ri1ioI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeizKftIIhunPYcCR0LwKqMoC3p6Pt9dbidowQRB5ZNO/8avxJnewotWVISmpGJgzgMkys7T+Fy454W61ZB74r8577Gury8dxxg9ezqnVIc6VYyFYsIUL15hXP2Wgr2OWWzaL6NX+7S3ozlI8W0qftl2dm1UpEJvacxT8UbAAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A77I0csl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A77I0csl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PLu6025889
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 13:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=95hHTOgsDguSuXKORfoFD7vr
	/pR9Ww99EDSaRcdphmo=; b=A77I0cslgUO6KN1avRSTcNvcEdxDhvbGDnAqsWYS
	1DiN3GG84OOsuDBjFqoch3J503z+vt58vf1Rc/tDcNA9XObdukHQnckRyuBcqpzH
	tgcM4NmzogXkGji8gdLnlZviqjw7uVtRXUuJevXmd0LZLAEnLqUEXsmKxwhvQhka
	lhnnlnSQFjC1MQzGeuod661zZAOxbxqds4j3GEkDmI4oVigs4DGXERU284JXsOFB
	ykEMTns9kINH7EmDXwAKgV8iAFeJCssaVwZmpbFO0xQru/sHuHcfvv+7QJDBJSlj
	LhB99VFEMtQcnDasXkeVRXP65bRkF1/kWRj5eXJlqsorCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnmruu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 13:50:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff68033070so6938576a91.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 06:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824232; x=1743429032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95hHTOgsDguSuXKORfoFD7vr/pR9Ww99EDSaRcdphmo=;
        b=hfJUM4dYzofHWr7Gn8Ygkr8mK9nFB61QU1c9UXFpH55uh6BDT5GRoIwxUlfZjh4GVM
         vC3+IyV8tWbzdDgC5hIrCP2DVBMxtp0B5n+pkGpzQcAFswBR2mIPShQ9T8wR478euOxh
         HatgPaMgZBtSsRtjcNHLPQsTpMmB5hoB35pmSzOIpEKoXAblMej4GCI6arKxPSBG9WlJ
         zomQ2SqZYo1UXbIp9+7aX/t7u3JIQaQj6CVrc5rGItPMhVn2tWtF3JFPvVJse29Qj+SU
         lEilMJoRo7F7Aql+XYEUtmkJjQkWy1RhW6Sh1StrJ6H7Aw+HNeeUWOnkAnB/HCwe4ra2
         HMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFY2iD90uKanRPH5llXw7Rdv8AMZtLxv7pIcyoarpnV9TGCfj5LSxiB8xJY8Pz+ccUUWwNs1T3rrwJNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxpBWOIRJgj/fKwcyD0+LfmYr+vByNn7LIUIZkQkGU0RoKA1Zs
	Gf/2MI6Hv6s+TbQPuIM+XhRnFTKDNlRJwPrtR4A3zzrxsu33/BxfhPNuB+ktsS53nZd3FQxEl+P
	qkNw72elGORr5gZxefUgMes7UIMy0Z1m+FsghIoPtKM7pKwHaAL3wBvN1Ab++S1+RZ8p3yGRGGT
	KvUMgUAITB1dz+C0bafZtufu+3/aOhpg/npew9
X-Gm-Gg: ASbGncsGFB76O+hSk5NvHtvgbS6C48fmcoZ1S/9YtV48GQxcsEjwlqZtshBbSxySakx
	tFRIz9EUqVdcVzoKirEgxGSQ2ZkihNPmGt4qp5EYbMW0o7/Ai/LQAlBJz5EBBKOx08UY40iwH1B
	NQT7Uu0lJfZE9hfa4eMxKFV32oelsQig==
X-Received: by 2002:a17:90b:4c0f:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-3030fe5b15bmr20207252a91.4.1742824231610;
        Mon, 24 Mar 2025 06:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXMOsAoGpdtih1+0ssF5i40YdS6JFQsTc0IGSXQBUtJaK2Mm+GfER10JaDD1Nn24M59aGXBRi9MPLEp7Jiixs=
X-Received: by 2002:a17:90b:4c0f:b0:2fe:99cf:f579 with SMTP id
 98e67ed59e1d1-3030fe5b15bmr20207201a91.4.1742824231062; Mon, 24 Mar 2025
 06:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org> <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 15:50:20 +0200
X-Gm-Features: AQ5f1JqiwDly8jNyPcDcoChNoCMpD8WkI2T1QYMZRnXTR-tMOVaIet3UtcOHoEE
Message-ID: <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e16329 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=OAj1MUjZvtZXw01r514A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: j4PivQQu8zCim8s_mCqVd0IQu9x37jid
X-Proofpoint-GUID: j4PivQQu8zCim8s_mCqVd0IQu9x37jid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240100

On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
>
> move to using mux control to enable both regulator and handle gpios,
> deprecate the usage of gpio.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  sound/soc/codecs/Kconfig   |  1 +
>  sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
>  2 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index ee35f3aa5521..a2829d76e108 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
>         tristate
>         depends on SOUNDWIRE || !SOUNDWIRE
>         select SND_SOC_WCD_CLASSH
> +       select MULTIPLEXER
>
>  config SND_SOC_WCD938X_SDW
>         tristate "WCD9380/WCD9385 Codec - SDW"
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index dfaa3de31164..88c758efe40d 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -19,6 +19,7 @@
>  #include <linux/regmap.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
> +#include <linux/mux/consumer.h>
>  #include <linux/regulator/consumer.h>
>
>  #include "wcd-clsh-v2.h"
> @@ -178,6 +179,8 @@ struct wcd938x_priv {
>         int variant;
>         int reset_gpio;
>         struct gpio_desc *us_euro_gpio;
> +       struct mux_control *us_euro_mux;
> +       u32 mux_state;
>         u32 micb1_mv;
>         u32 micb2_mv;
>         u32 micb3_mv;
> @@ -3235,17 +3238,31 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
>                 dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>  }
>
> -static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> +static int wcd938x_select_mux_state(struct device *dev, struct wcd938x_priv *wcd938x, int state)
>  {
> -       int value;
> +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);

Hmm. Does this really work? You have selected the mux in probe
function, now you are trying to select it again. If I'm reading the
code correctly, you will get -EBUSY here.

>
> -       struct wcd938x_priv *wcd938x;
> +       if (ret) {
> +               dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
> +               return ret;
> +       }
>
> -       wcd938x = snd_soc_component_get_drvdata(component);
> +       wcd938x->mux_state = state;
> +       mux_control_deselect(wcd938x->us_euro_mux);
> +
> +       return 0;
> +}
>
> -       value = gpiod_get_value(wcd938x->us_euro_gpio);
> +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> +{
> +       struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
>
> -       gpiod_set_value(wcd938x->us_euro_gpio, !value);
> +       if (wcd938x->us_euro_mux) {
> +               if (wcd938x_select_mux_state(component->dev, wcd938x, !wcd938x->mux_state))
> +                       return false;
> +       } else {
> +               gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
> +       }
>
>         return true;
>  }
> @@ -3261,11 +3278,22 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>                 return dev_err_probe(dev, wcd938x->reset_gpio,
>                                      "Failed to get reset gpio\n");
>
> -       wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> -                                               GPIOD_OUT_LOW);
> -       if (IS_ERR(wcd938x->us_euro_gpio))
> -               return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> -                                    "us-euro swap Control GPIO not found\n");
> +       wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> +       if (IS_ERR(wcd938x->us_euro_mux)) {
> +               if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> +                       return -EPROBE_DEFER;
> +
> +               /* mux is optional and now fallback to using gpio */
> +               wcd938x->us_euro_mux = NULL;
> +               wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> +               if (IS_ERR(wcd938x->us_euro_gpio))
> +                       return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> +                                            "us-euro swap Control GPIO not found\n");
> +       } else {
> +               ret = wcd938x_select_mux_state(dev, wcd938x, wcd938x->mux_state);
> +               if (ret)
> +                       return ret;
> +       }
>
>         cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
>
> --
> 2.39.5
>


-- 
With best wishes
Dmitry
