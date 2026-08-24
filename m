Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF633E451B
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553034; cv=pass; b=Sde92UPMV/esSGaFbe58GJNRcMxdUp2MtlAw9p4mfqmqSoexY6QMGaSuQU5zCPvI3cmHLU+F6C9/tV843+FCWzsNf5M6d5pnmTbDhP+w893Oso7z4fHELYK4IMZWZ3kQFxCrT6Tufk+hoqV1lT6o3jIkeiEA+Bd3KNoYnEz1xBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553034; c=relaxed/simple;
	bh=ye7a1U2+Qid8ovzQbkmGTf8UHVH2C3CVsSrYv/e3tCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkXEa6JKJBXVcUT1niVcc0OLnZNIinIgDn1GSpDNUMIxbwTNy69Xj5Vp0O5yMM6XeF19e9t0pR/G+JQTIkzaZPRKZqqtp6rKauDhdkb+XfYIdH3UCtmd6tpXcS29AEUpsk64tsaVfkAvw0POhP7fvZJIZxneCxRd/0kX/pgo1+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGVpVZ5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmRoLkP/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGVpVZ5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmRoLkP/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RHu01577198
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=; b=mGVpVZ5e033eMNA9
	+Ly44u3PsIlJKGGhryilmBrXg9e+vIJQfQwxBTQAU0T+AALyCvI94wS8+aK1x7Ud
	0IOrvJgiyLIr7KLjcEw1wRHtiWzqHphE78zFpfeCeGsqyNcNm1QobeEKVX7mMng+
	DQ2+w9Ds0iSZ5chUTroyW4nVefJZ9SJKMMsUYh+oeEMONg5UWYy/IwWz8dpHDgCD
	/1qe+msBOiF/U1b3XBmFIZ8M6ooz7aLSAAGtR8j4QF0kX9mQNYQQoBZzdMWEBoAF
	sKKP8FkFNQoeb6wFczYzndr8kM8OpG1AJLZ6kJH954fHK25pkPx+C7DhTf/4J2nd
	1eM5jg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcwgxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:30:31 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8331536a939so125982607b3.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 23:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787553030; cv=none;
        d=google.com; s=arc-20260327;
        b=AjVGuXAs1/lfEdTLXKb/4tbb2wB0O3i4whahXcpkBejkAFHWWfTjlDleoKPhAhFAUc
         csJGEufRxICt+naYNwDcYdwFoE17jtG8e2Q9Rv3qHxNOdpNJMkx1MCGxsMEAF/ok/Y7Y
         vw0ZU5CNk7wtncmmqIk7Pqh7vQRjQNtUwVpGNjZzxRUFK0vZQ7PpYnkaQsW6Yxq3Tl48
         cxIe558TMZsHI0pKFFYQY2XHk+cqlQRMg/k5UD9CBjJaqoMFr/oLlTtNcEmepKISl7UC
         TAaLXYUsv3N+SOypG6Mmf/VD2ZLtEqeciGFy9roxCNK18gz0c7iiVpIngSpzO7/uErWs
         yCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=;
        fh=iGariA2DjYcM69zeMzR0xSy0nbxYPZWvqNaTRy04yk4=;
        b=JnwI7Lt3DT/Jx4MlGG9lm5D8bqaIFU9d8cAD+TRAuFHapb/CS1WdBjWTPppeycZ39T
         /QpzGTqpfHXScyNYE8vRwPqJgk5bjUEhcXcjfyFy1Sv+hCrD4CKh77qL8CBFa1s2OeqZ
         igELgHdUUwrTIWm5MJ2zcIJXXRbGsvfZmHGstxSF7z59o/kHiwaJ4gtGSc0h296IM2m6
         KNASVfiS6Pn0fg3508gn4PSR3uu3rnW/vdcw6tHb1FfUlvSz2tgaGXLqH7Q6RHM3dtaE
         YXFIqquSHyiU7sU7ULpQevm0u9rsJbnQpAKr9M9on+gLFCKfR2iF5tL5wKF1XzTzRJfX
         0/wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553030; x=1788157830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=;
        b=GmRoLkP/3375+KexfJ5uxWgXMHfqvpfVwPZlNHzP8qnszF0GL74wyVQF08JrNiLcbD
         furtzepvp6IWQWOLFDFq8jLN4ui5KBGHcxyVj1Vo12+6BOTEi0Xadx7K/xympIJxGXAD
         1ieUaQZJHZT5HvBrUh+hzaM5wzn/1zk0gFarBbaWF9MJLdNuCrSGOyHBWz0z0Cj7asXv
         74IDC+P4mZHPDyABtPFofvnvIlkC0nW5SrUzGcuTxzwUZvFed6s1J4Pz6R6GYABzV0tE
         HSH+aEhBU9L92Q79xsXI8Ba4ptAQMW7qdeQa68E8NoaV35a6BIK2BUfP6uMEbPfOC+2E
         pLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553030; x=1788157830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rcxx8nwljTWIn8Go3FcRlz7Bnz1/OdQ7azqtCwSxBhc=;
        b=QbLomvoKVVvfTPJ7H1HsZFlhX+SXbJvBJoQiDedF2F+v7b2n0vDRKjK5Wnyk9jTAXH
         1v+fW3t1YleX1TzPiemdfaKnDnKNferkyyWZ9EofaNnB+U1PcpOdBDb6izMlicf2QK2D
         CzplXZb75uSZ/zXdmScCbhHMXOT6XeDX9hZ8P6uZ8/vqXogFJ0lQqscdn4PGD5GJEexl
         JnZeioG+KXK3NJ4u8RDy6b+nuypknCUGBRMmkCh6JNtOWFuswn9FRFAvVu+9R2ho8tyu
         /git2/aktd8VW+lW2Or032JDoKrY4ZhdVvk9BTaolT0yslc2QauF4JNR9f3ZuAgDVLQN
         GMVA==
X-Forwarded-Encrypted: i=1; AHgh+RouHvlJZ7BWxGyRXLoxIDXS7Q62zYsRdJGTPGDpCT8IVgVsvM9rDZfkhpH4hcauicYQOwVHIPsv5IIn4A==@vger.kernel.org
X-Gm-Message-State: AFuF++ny4jfABs2CjbaKkOFwbGpHFW5erC2ICWq11bhMfukaq7T13xTE
	pJBEgFmv8xJsFASvIWzy0GHKPPWI/tNtuve5PRZfuuFF5tw7moh/QpWPo9R4fuklVX6SQPvtKZI
	Ihf8GVYmfZcmHoBH2vJc1Wo5vTXAqqJwygEgr40ou82rif7px+CX1iZh/nHCCbqV9ITeJtquey3
	5MMGomX20jVnYbaBmUHKrrrtb4kOxxKs0zc1sEjRNA
X-Gm-Gg: AR+sD11CzqA4QUwCDofp0KK43h7TeRCfOf5N6YQabXvjJ4VtcibpeM6gTNFZCYXvbjz
	GIYKW5FvJlYbjdA1sXy6qSPGSLWkpdppPzs1PvPb3xEUd0Vk9TomrHY2+aVrrtLR0F5Hi8Oxzje
	Kv7+KzR8jX5RbAU49rAsJ1oz8bXB2L+P+Z5tz1Yl3CIX0x5jTXIF6mY95w2Hw=
X-Received: by 2002:a53:c3d0:0:b0:668:96a9:e54 with SMTP id 956f58d0204a3-66ce4a4f19emr7177430d50.23.1787553030334;
        Sun, 23 Aug 2026 23:30:30 -0700 (PDT)
X-Received: by 2002:a53:c3d0:0:b0:668:96a9:e54 with SMTP id
 956f58d0204a3-66ce4a4f19emr7177404d50.23.1787553029698; Sun, 23 Aug 2026
 23:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-8-harendra.gautam@oss.qualcomm.com> <20260702-stoic-chinchilla-of-nirvana-3bfb14@quoll>
In-Reply-To: <20260702-stoic-chinchilla-of-nirvana-3bfb14@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:00:17 +0530
X-Gm-Features: AcwNN1WG-ROX4FyK_RvAZB5pfr_kIMUR0tjuj86TanEWc12WQU2-2q0XXTylwRw
Message-ID: <CAC-tS8AzrQWPE2tQANBRVEE_2RwzteUkrKNZeLbu91iO__QTFA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] ASoC: qcom: Add QAIF regmap, DT parsing and
 platform init
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: lG3MaSGV2a1A6Rcv_xwwFwq2oNVrZLBG
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a8be507 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=sLgd8sIBHoX68nViayQA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: lG3MaSGV2a1A6Rcv_xwwFwq2oNVrZLBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX+0JGP9Ckn51c
 L1sRLSon6yRxTXEJWBkz03hnJu5+YxEB8M5rpK37K346ZWm1TvEKzefNncy+G9mCQx41Uy0qAlw
 5nQdT8myVDGJWpeuAefmWPx4LnwjTcfdH3f7GKSVrsqREImnAtULLNtn2GBYQGVy/Rva03B9E5A
 UuyE/R1XMC4lhcAuit5lIPBf+txn5km+UbSnDOYZmjE1Vj5oQniH+q41D9OoKWgDLighpKvDnru
 G9ksfVroaKYy/FSG36qRGijL3DHrz0yme5ny49mDY9rTCYl9lwocESCLV5gVLtAauuxY5+kz4ak
 46Dn4VLnG2ddoJeIizI1VcJS+tpz9RsSiWICGJBqrhz8Mihfj4rqmvPVtIJdDLPSjzZmlbcMg+b
 QiVbRyGHtzEftaknfZBAJcmRYa2TQ+2KKFMFugQCi5WmvHPulw1pH1yohLXGpGamIQELpkD6EE7
 eqLSljNCra3zCj0VS9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfXxMhya1j+wfyk
 PutLdDh1hnWPHlke/ueffQNBIfVQKw0jCw6s/yjfuqYal6Sl4HLLQSMUyCD0OXznQbR4gO4W5MZ
 1oJTASuRbDWToAQmpkldk4uafGXw2tI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:53PM +0530, Harendra Gautam wrote:
> > +/**
> > + * asoc_qcom_qaif_cpu_platform_probe - Probe the QAIF CPU and platform=
 driver
> > + * @pdev: Platform device
> > + *
> > + * Initialises the QAIF regmap, parses DT, sets up clocks and register=
s
> > + * the CPU DAI component and PCM platform.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct qaif_drv_data *drvdata;
> > +     struct resource *res;
> > +     const struct qaif_variant *variant;
> > +     struct device *dev =3D &pdev->dev;
> > +     const struct of_device_id *match;
> > +     int ret, i, dai_id, idx;
> > +     bool variant_init_done =3D false;
> > +
> > +     drvdata =3D devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> > +     if (!drvdata)
> > +             return -ENOMEM;
> > +     platform_set_drvdata(pdev, drvdata);
> > +
> > +     match =3D of_match_device(dev->driver->of_match_table, dev);
> > +     if (!match || !match->data)
> > +             return -EINVAL;
> > +
> > +     drvdata->variant =3D match->data;
> > +     variant =3D drvdata->variant;
> > +
> > +     ret =3D of_qaif_parse_aif_intf_cfg(dev, drvdata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to parse aif inter=
faces\n");
> > +
> > +     drvdata->audio_qaif =3D
> > +                     devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(drvdata->audio_qaif))
> > +             return PTR_ERR(drvdata->audio_qaif);
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (!res)
> > +             return -EINVAL;
> > +
> > +     audio_qaif_regmap_config.max_register =3D resource_size(res);
>
> Why are you modifiying static variable? So if second instance is probed,
> how is this supposed to work?
>
> > +     drvdata->audio_qaif_map =3D
> > +             devm_regmap_init_mmio(dev, drvdata->audio_qaif,
> > +                                   &audio_qaif_regmap_config);
> > +     if (IS_ERR(drvdata->audio_qaif_map))
> > +             return PTR_ERR(drvdata->audio_qaif_map);
> > +
> > +     ret =3D of_qaif_cdc_dma_clks_parse(dev, drvdata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get cdc dma clo=
cks\n");
> > +
> > +     if (variant->clk_init) {
> > +             ret =3D variant->clk_init(pdev);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "Failed to initial=
ize variant\n");
> > +             variant_init_done =3D true;
> > +     }
> > +
> > +     for (i =3D 0; i < variant->num_dai; i++) {
> > +             dai_id =3D variant->dai_driver[i].id;
> > +             if (is_cif_dma_port(dai_id))
> > +                     continue;
> > +             idx =3D variant->get_dma_idx(dai_id);
> > +             if (idx < 0)
> > +                     continue;
> > +
> > +             drvdata->mi2s_bit_clk[idx] =3D devm_clk_get(dev,
> > +                                                       variant->dai_bi=
t_clk_names[idx]);
> > +             if (IS_ERR(drvdata->mi2s_bit_clk[idx])) {
> > +                     ret =3D PTR_ERR(drvdata->mi2s_bit_clk[idx]);
>
> Wrong syntax. Please use dev_err_probe.
>
>
> > +                     dev_err_probe(dev, ret, "error getting %s\n",
> > +                                   variant->dai_bit_clk_names[idx]);
> > +                     goto err;
> > +             }
> > +     }
> > +
> > +     ret =3D qaif_aif_cpu_init_bitfields(dev, drvdata->audio_qaif_map)=
;
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error init aif bitfields\n");
> > +             goto err;
> > +     }
> > +
> > +     ret =3D qaif_aif_cfg_cpu_init_bitfields(dev, drvdata->audio_qaif_=
map);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error init aif intfctl fields\n"=
);
> > +             goto err;
> > +     }
> > +
> > +     ret =3D qaif_cif_cpu_init_bitfields(dev, drvdata->audio_qaif_map)=
;
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error init cif bitfields\n");
> > +             goto err;
> > +     }
>
> Why do you need to enable the clocks before all this init? Do you
> actually access the device here (like its registers)?
>
> > +
> > +     ret =3D devm_snd_soc_register_component(dev,
> > +                                           &qaif_cpu_comp_driver,
> > +                                           variant->dai_driver,
> > +                                           variant->num_dai);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error registering cpu driver\n")=
;
> > +             goto err;
> > +     }
> > +
> > +     ret =3D asoc_qcom_qaif_platform_register(pdev);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "error registering platform drive=
r\n");
> > +             goto err;
> > +     }
> > +err:
> > +     if (ret && variant_init_done && variant->clk_deinit)
> > +             variant->clk_deinit(pdev);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_probe);
> > +
> > +/**
> > + * asoc_qcom_qaif_cpu_platform_remove - Remove the QAIF CPU and platfo=
rm driver
> > + * @pdev: Platform device
> > + */
> > +void asoc_qcom_qaif_cpu_platform_remove(struct platform_device *pdev)
> > +{
> > +     struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> > +
> > +     if (drvdata->variant->clk_deinit)
> > +             drvdata->variant->clk_deinit(pdev);
> > +}
> > +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_remove);
> > +
> > +/**
> > + * asoc_qcom_qaif_cpu_platform_shutdown - Shutdown the QAIF CPU and pl=
atform driver
> > + * @pdev: Platform device
> > + */
> > +void asoc_qcom_qaif_cpu_platform_shutdown(struct platform_device *pdev=
)
> > +{
> > +     struct qaif_drv_data *drvdata =3D platform_get_drvdata(pdev);
> > +
> > +     if (drvdata->variant->clk_deinit)
> > +             drvdata->variant->clk_deinit(pdev);
> > +}
> > +EXPORT_SYMBOL_GPL(asoc_qcom_qaif_cpu_platform_shutdown);
>
> I do not understand why do you need wrappers over single call of single
> driver. You do not have different variants. And even if you had
> different variants, I claim they will have exactly the same clk init and
> deinit.
>
> Again, this looks awfully like sending us a dowsntream driver which is a
> known antipattern of upstreaming.
>
>
> Best regards,
> Krzysztof
>
Addressed comments, will raise as part of the next patch.
-Harendra
