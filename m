Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63E52638B1
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833128; cv=none; b=FyBQlQOfX3eRcsrQtz8dl8zpTqkPI8qLelwGQzIlKOY+B35pZDY3WtWzb7Qm64KxujpCc7JVQeJszx/xFqW4xmripFOifIsa0AOuZUljEY3ehaYDnFKjRPGv75F5tgv4lt8TnODmkHRUeLeCzZGJHT3qRMnKS60FRfMXNZe6hzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833128; c=relaxed/simple;
	bh=FhoXOYAA1iz/4SuQApCmCCm7e20hHuDPIHWlBiVTuas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GanH4vbrX4ErglHh0L0yvK42gIfIG7efvJUxExT1sPDxBkBeicP0m1nzYGD/CWyFbiAzUMEYQIUFCRiIt03BIQjIhIDWb7aa72nVAYLxxG6DCciaefPcLu6II/5DZd3TS31nkeTG+3V0akRjHA9WwVgWaZTeE/jJZiXG9HcGyUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVuZKjCz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVuZKjCz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PMQw004163
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 16:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wlqnd0XrME7ieQy3eY1m4t2l
	0GttO4vmYnyHol1MECg=; b=FVuZKjCzLD2+hAjZyrfggO4TbayQ+2FalZEUdx0h
	TxNhn0mqqPMwv/+WI8f8OCCOsBq8CN9W7jCTp3MRhXxgrRQO91GtuigWM252ybrT
	3WHONsjZ42N0ybxJlgejnEN/UTxO1pF5Bou3xarTS6X9cOwcExyL7xKia8pu1OuB
	3aKGRRKEN3dhhF2IQDVsEu9qfuHayx1prrbJoqzv29xuWD7Ezhn821WNhFYGetRa
	jG9aN5EA9nY4iONowS7XBt5xU+uIpQWB56APPDvSAvCvHtelWKHbwd0JwEjuO8Tt
	ROChe4i4q14uhkbrRtHT8rX4rU8bGwASadF6FNN36gJwTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnk8mxnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 16:18:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so256014685a.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 09:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833125; x=1743437925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlqnd0XrME7ieQy3eY1m4t2l0GttO4vmYnyHol1MECg=;
        b=sCii5IlbNc/NFSJ4Ao+duhxyDdEhf5+Ae00ibM8tYF6cNqyuoxXnhCGeZ0Njkak3WH
         Rbx9cYl5bGReWnj0pSQEAlJRu4HyblAg9511wc0mr4eZSQINC7phK/zFfyEHzQNzgH70
         PnFjRQm/h4LJGdOm4GO4eySO936FFgWxGcIG1eFXiHySj3jWz5GRwA/Np7qR3Q9yt3a9
         pxVlhLYLu322ZsQYKvyt5cFWXtv/aCaoFtM4OQEQcfyPsDb9hKthquOC87TtjkvMWsLI
         z+qf7WAX47U+lVJSRmwGgXG5C3T8zCmN5JcgJDZRFRebKWKGJ9YEozYUfE66ussyIMpA
         Snlw==
X-Forwarded-Encrypted: i=1; AJvYcCVZW/OVKZ1XqdoKM7VRI8JdOdQW/aFk5PVdfqNW2rKSL65F37T+cqd4V8i/gBzW5oSCxHJZbexGA2UT5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YybdYeIxkg9Y5f7FcxeziZV/oBoyLdtp7bklc7FN90mF371qEaM
	/N2o/EOI/5irt795yPR1wnt9c19r5XZ2JJNgi0zBNHioFEJws5DyGmcE6u8d/v7gLl+GLO+RCs1
	b6v10L2QMuvXVEEAngv45PjORn8hfRK2gb4r4qEwcSRe4PWpm6F1SQsyx2gkpCw==
X-Gm-Gg: ASbGncsD/yTxPpZBJ0iBJ3oJ/S1I9j4y6qbkdZEqLrkTTNb0CMiruG/hEUJUHjM1SpU
	E8RGo69ZCwnKS/c47GVGFhue6sLpFRWCZFNwoE/VjvuWpcAU78Mm3tQKMNhbEWb1Yes0ohbXLQy
	9+1B9WqmKVXY1A4B1+2Ar3hSQGozkAu4vDtRAVpPNEEqx90KIivM4Gl6tG1MrBvzbDGZKz0JTwl
	HZhNXo02snMJwDFwW5smw0KGfdb3jlbKxe3bUoEm+984gHdO37DMU+a56k+vz/Qqkh+PFcYhoJX
	VjUgiNDfCsKLKqPsBhsT2d4jSbEraOmjlOIvF28s/VYtpd0jVqehvB1KLDMy5LfEPgqjOkdfpMQ
	KlYo=
X-Received: by 2002:a05:620a:46a5:b0:7c5:4738:8a0f with SMTP id af79cd13be357-7c5ba1476f2mr1698183085a.15.1742833124470;
        Mon, 24 Mar 2025 09:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0TAppUS3Au1eXF33air+jgVxzflNCCe1SVJzl/UnSMYgb3QVULayRcEbJnNV1cMl1e1FQQg==
X-Received: by 2002:a05:620a:46a5:b0:7c5:4738:8a0f with SMTP id af79cd13be357-7c5ba1476f2mr1698179385a.15.1742833123865;
        Mon, 24 Mar 2025 09:18:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b635sm1188629e87.63.2025.03.24.09.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:18:42 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:18:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <fdshfu4g5bzrpva4skvydh5lizhtkqoskivoda7q2ai5byqd4j@rjza74mudtz5>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
 <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
 <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
 <ctcqkdbv6zh2rabkkr7tlhxlcfsn5nazjfbsnbbu4l4blyakft@pejdsvnazfh6>
 <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
X-Proofpoint-ORIG-GUID: kNbKUJ6GZy-verNbkVVtS1xNOkzHA3M2
X-Authority-Analysis: v=2.4 cv=KMlaDEFo c=1 sm=1 tr=0 ts=67e185e5 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=9UW2u0tblTimzNtmCfUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kNbKUJ6GZy-verNbkVVtS1xNOkzHA3M2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240117

On Mon, Mar 24, 2025 at 03:58:32PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 24/03/2025 15:18, Dmitry Baryshkov wrote:
> > On Mon, Mar 24, 2025 at 01:58:06PM +0000, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 24/03/2025 13:50, Dmitry Baryshkov wrote:
> > > > On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
> > > > > 
> > > > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > > 
> > > > > On some platforms to minimise pop and click during switching between
> > > > > CTIA and OMTP headset an additional HiFi mux is used. Most common
> > > > > case is that this switch is switched on by default, but on some
> > > > > platforms this needs a regulator enable.
> > > > > 
> > > > > move to using mux control to enable both regulator and handle gpios,
> > > > > deprecate the usage of gpio.
> > > > > 
> > > > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > > Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > > > ---
> > > > >    sound/soc/codecs/Kconfig   |  1 +
> > > > >    sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
> > > > >    2 files changed, 40 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > > > > index ee35f3aa5521..a2829d76e108 100644
> > > > > --- a/sound/soc/codecs/Kconfig
> > > > > +++ b/sound/soc/codecs/Kconfig
> > > > > @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
> > > > >           tristate
> > > > >           depends on SOUNDWIRE || !SOUNDWIRE
> > > > >           select SND_SOC_WCD_CLASSH
> > > > > +       select MULTIPLEXER
> > > > > 
> > > > >    config SND_SOC_WCD938X_SDW
> > > > >           tristate "WCD9380/WCD9385 Codec - SDW"
> > > > > diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> > > > > index dfaa3de31164..88c758efe40d 100644
> > > > > --- a/sound/soc/codecs/wcd938x.c
> > > > > +++ b/sound/soc/codecs/wcd938x.c
> > > > > @@ -19,6 +19,7 @@
> > > > >    #include <linux/regmap.h>
> > > > >    #include <sound/soc.h>
> > > > >    #include <sound/soc-dapm.h>
> > > > > +#include <linux/mux/consumer.h>
> > > > >    #include <linux/regulator/consumer.h>
> > > > > 
> > > > >    #include "wcd-clsh-v2.h"
> > > > > @@ -178,6 +179,8 @@ struct wcd938x_priv {
> > > > >           int variant;
> > > > >           int reset_gpio;
> > > > >           struct gpio_desc *us_euro_gpio;
> > > > > +       struct mux_control *us_euro_mux;
> > > > > +       u32 mux_state;
> > > > >           u32 micb1_mv;
> > > > >           u32 micb2_mv;
> > > > >           u32 micb3_mv;
> > > > > @@ -3235,17 +3238,31 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
> > > > >                   dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
> > > > >    }
> > > > > 
> > > > > -static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> > > > > +static int wcd938x_select_mux_state(struct device *dev, struct wcd938x_priv *wcd938x, int state)
> > > > >    {
> > > > > -       int value;
> > > > > +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);
> > > > 
> > > > Hmm. Does this really work? You have selected the mux in probe
> > > > function, now you are trying to select it again. If I'm reading the
> > > > code correctly, you will get -EBUSY here.
> > > 
> > > On successful selection of mux state, the mux will be kept available
> > > (mux_control_deselect) for any new callers.
> > > 
> > > So we will not get EBUSY for the second caller.
> > 
> > No. wcd938x_populate_dt_data() selects the state by calling
> > wcd938x_select_mux_state().
> 
> At this point we also released it (both in success and error case).

By which code path? You call this function directly from
wcd938x_swap_gnd_mic() and the control is already selected from the
probe path.

> This will hold on to the previous state unless we have defined a fallback
> idle-state.

As I wrote, this doesn't seem to be a proper use of MUX API. I think
it's much easier to add a boolean which states that MUX has been
selected and use it to deselect the state both in this function and in
shutdown path.

Another option is really to expand the MUX API to add 'switch state'
call which will work if the state is already selected.

> 
> 
>  Then you call mux_control_try_select() here.
> > As far as I understand, it will return -EBUSY as the sempahore is > already taken. Moreover, this is not how the MUX API is supposed to be
> > used. The driver is supposed to hold a state while it is still in use.
> > 
> > > 
> > > --srini
> > > > 
> > > > > 
> > > > > -       struct wcd938x_priv *wcd938x;
> > > > > +       if (ret) {
> > > > > +               dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
> > > > > +               return ret;
> > > > > +       }
> > > > > 
> > > > > -       wcd938x = snd_soc_component_get_drvdata(component);
> > > > > +       wcd938x->mux_state = state;
> > > > > +       mux_control_deselect(wcd938x->us_euro_mux);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > 
> > > > > -       value = gpiod_get_value(wcd938x->us_euro_gpio);
> > > > > +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
> > > > > +{
> > > > > +       struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> > > > > 
> > > > > -       gpiod_set_value(wcd938x->us_euro_gpio, !value);
> > > > > +       if (wcd938x->us_euro_mux) {
> > > > > +               if (wcd938x_select_mux_state(component->dev, wcd938x, !wcd938x->mux_state))
> > > > > +                       return false;
> > > > > +       } else {
> > > > > +               gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);

Which codepath will update mux_state in case of the GPIO?

> > > > > +       }
> > > > > 
> > > > >           return true;
> > > > >    }
> > > > > @@ -3261,11 +3278,22 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
> > > > >                   return dev_err_probe(dev, wcd938x->reset_gpio,
> > > > >                                        "Failed to get reset gpio\n");
> > > > > 
> > > > > -       wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> > > > > -                                               GPIOD_OUT_LOW);
> > > > > -       if (IS_ERR(wcd938x->us_euro_gpio))
> > > > > -               return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> > > > > -                                    "us-euro swap Control GPIO not found\n");
> > > > > +       wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> > > > > +       if (IS_ERR(wcd938x->us_euro_mux)) {
> > > > > +               if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> > > > > +                       return -EPROBE_DEFER;
> > > > > +
> > > > > +               /* mux is optional and now fallback to using gpio */
> > > > > +               wcd938x->us_euro_mux = NULL;
> > > > > +               wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> > > > > +               if (IS_ERR(wcd938x->us_euro_gpio))
> > > > > +                       return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> > > > > +                                            "us-euro swap Control GPIO not found\n");
> > > > > +       } else {
> > > > > +               ret = wcd938x_select_mux_state(dev, wcd938x, wcd938x->mux_state);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > > > +       }
> > > > > 
> > > > >           cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
> > > > > 
> > > > > --
> > > > > 2.39.5
> > > > > 
> > > > 
> > > > 
> > 

-- 
With best wishes
Dmitry
