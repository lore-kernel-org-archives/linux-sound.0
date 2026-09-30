Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622FA33AD85
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746152; cv=pass; b=YOvMaX2Jk7EUxuX/HC7FX9dqPHhcYsc35f0WVAvpoTQqdx2ULV8sSoe6+QOcSRwUuil4NKd+uyoiwxFwfSRpcmxBRUi6jNpR7LAF4YDv8exUEPqh8naZtaBwr4/x+Z9fapxDhWzLL05YvjD5t0l+6XNKa62nx6//QaNkcmC0D5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746152; c=relaxed/simple;
	bh=tmkV2mmrDajYN4om5U0hwK0CBQDJGtjxBhnoqqbgOyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jqf3QUtUHu/wF4Gxc0OgjrjhWQLnKXO6LBm9ygoNZRxYOs+RPdQXvVWIn1sszZ6nmpakRcpzxRhuz179N4HuIOJkh0G1XUqnxdBdp5KgxYOX2P2BcZU2GgtGWQlm28YbvqOU8n6AQGym5hqavXSJVF4xdfK0OcqoEbYc8DdfrqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjSZTXfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJoz0vFj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjSZTXfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJoz0vFj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPuJH2876405
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dx/vIXhRvwG/JlTZaI/6ZuIX
	DRsDVwL2S+wzlVM9WPA=; b=pjSZTXfVK5pKLSc2tlWVvF+bggB8RgSlMVso3NBO
	in3EqWupw5bRKnJhOmltx77ioExVOUg90cnrtmtRENoKTecmwXTlD/dow5qZAYV0
	KP9Z+YtGZOTnWcjL7scN/B+8PH8jTT03tEnvuChgp203ZQ12res04g3zUtkKNVYz
	sstctbaGkJoGR4mgQ/wR5hOUrHc6d6U9nf+iRFSZhf7zivrYatuhSAUGUrnNL8nc
	KzSHnJmi3XJlc7oURLU9NnyB7mKBlNRVWWJQ61HWOZRm4MVUCzs/4TnJZ5n5J4Vq
	gnjoDIydEfNEvLzhNSBgr5yCr38lw1JIJEi2yZGsJZfoHA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et2bm1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so7512159d50.1
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 22:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790746150; cv=none;
        d=google.com; s=arc-20260327;
        b=P/CWXu9WxIylT/H5ZEx/wk8DYzmZE5jjK9NIbbviiX9JuMFeaABFd+ZMTMV1Y88K2C
         5uLHesj8PbofQEKu78h0q+PxDuLxZdQdvqLqXttxPGpiBx/3qgYcrxNYuW5oet/1A9Hu
         aElND6DKkCl8VWQ9tK+tPg0Naaz7neKto5e/cvxM9PWmZrS7cL5LeFn9WEl+6IMsZclb
         gg3GN6yzpi2HEDu1i5sU7MPSos9emujlP6ZpnxDkf3U2LQs2eLMgdwmYVmy37C9Pvqib
         Wf1MVz1/QwwAgkqro2gSeeq5qiWTpuoc0dm952YdPr0tX6wx5iO4Thfvlu/tbLYIEuZM
         0v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        fh=3RznkWQTceCr66tjTcclQKQ/q4UsOrZ4IjIOjqfqJrw=;
        b=fwR/eFBYwm+MstG+mgfqBjVQtYnJkrXd8Mrl4uB8mSnipqJfxXxZJd86H3ZqWWHRoi
         qcp8NOQqyniBwbr45boCGF6QC5Jnu5dBmVqUvXcGztbWIlv6ZkGoWadRQDwcx7xoPtgC
         dC/pwngU0+swtSI7xl/1WkyrX2eYa+m1vOMik5CDLq396XoDXYttO3o5o++Cl7PgLDVi
         h3XlGeaYXKgNT4dw8K7EnbsYNrRaCHYP7K2uc5iLo3j0kOZCtEvQpiphCzGJRG/Da0da
         97RySXcAZqLQ9kRWV5LWE/NpelXIulGhE8I7Jux/A/ZV0WM3slkpg+6cKhxUl2pUDMOC
         1Dcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746150; x=1791350950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=CJoz0vFjqksus96ZF0nl4mlNfSiDP6EkBClOsXIIYbZPHOBr4FTYHaFN9hNwmxUJ7a
         Qbhr8RG5KZx9CNyWBCd7/2KVdEzPqLzx66D7P89sp2Ga2lt7n6T5tLx9mdW3ER34eRYG
         6k1+xmiZeDX0uSBU/9L1UGh7d0OSXWkX9qrbfC8q0qmBeJtJJqLhFCiiLJ4jbHkvu7Aw
         WjPnkDDrtpEL5oUR3/9zuWeyZFjbQ1UVmoDolqEC0R5ACkvAX3BQRBBfQ0HIVoGhF0v/
         oDJGiVhCa17T7zlADd90hSidopTSjfUbABIRzwPzEJBqF02Yil9qdycNZhc8tqbwaVWU
         C9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746150; x=1791350950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=DkSaJtDmM/69pUqXw7rVAUtzWwUHMmS5Gr+qyHyr238BZYBtlii4MxX6UAmMRDHCVg
         S+Dh2zIxe0WAw7YY+HnyckjsLCeOlX9U0l3Xdl3vuuy+IpkA5QjrmwETCYKCu27NShmB
         iYJ3Bm4qtlv1CB9dh+dXI9cwZlO6bhC5BPRREZLRwMh9Wli3tk2cpgGsLkmSqHBdvZLn
         pmFV3mQ9CsoUvbqrNotwKfaE9KDRqnI28DKPO4b4GyABadc73UeEo4I4zwwODNweGcKH
         +UbCm1rmvOV4qCiVrmkqFbqz/Z1bXt8xEhk1znMX62FWe6A7lpYIAiVfBwHzAUppFFgY
         DfCw==
X-Forwarded-Encrypted: i=1; AKwUvByVBHrVM5Kmm4fgKh/VbBnX3tWIW8W0+bNHgbemR/eSsjhTB7QvRmhQxKbzLsVAJFDYWntGNgisVjhekQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZoFHvCW7ZgPWekqI9N1VM7m5XsvQe5nLL7t6G3xO16R4hT3mJ
	BWWM8h0CVs5bdC7nfQtixhajEhTGIGidPDgDlxFHMoBq9KUszn3iP0Kp1IwwE3jWmxqjMpBMORY
	f/d537a5ekjPTQ/Gz0MHP26qcmRjHt/XdagZW1CWRevwawEFb/+kZ02WM+VcQ5sGU0DWq4UAh4V
	yQGh9nONt41tCHIf7EOTx7ig0bBUaV5Qd9zctWNyaL
X-Gm-Gg: AYBFou2PFNNHEghJPEJbS2XL3QoqulYjZDR7Piy5Q+GDCvYDU/VLihBUEPhlG5Yi63d
	LNtQGPJF6Sk0IXHaR2chHGtTB0BRhKlx1yQJ8G4wOoZE52bUDaJxavxGxBpkaVbX0vjcBWGXpcG
	dC26RsJuKlwNsgA2XKS6XSvdyRAkLu7WCRYxddmkSiwoKCMECr3tQwyh/geiM=
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-6768341b8efmr88864d50.40.1790746149638;
        Tue, 29 Sep 2026 22:29:09 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id
 956f58d0204a3-6768341b8efmr88852d50.40.1790746149235; Tue, 29 Sep 2026
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com> <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
In-Reply-To: <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:58 +0530
X-Gm-Features: AclHuK_2UWWBuq0p1Je2wHGBs_QJZlSZJ2ybw4Wpxuz_xTntYkBQ0_fPsF_Bplg
Message-ID: <CAC-tS8CTOcAZ-x+q7mnvJgc1ZgiRLmQgvsqAFWHOK7YLSfCLog@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] ASoC: qcom: Add QAIF IRQ handling and platform register
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 2Iuoc12hD-1TsZyJJF8m4nYFUHMkvKsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfXxLpjHmSCEXVl
 WhIlBGU3MunZ4Kxw5sD0v5GkbG3B5jizTm8feXoobSfSFu+NRuvmKvoNyFy9Aa9jI9VBXRBWxjj
 QX0xJKTrY04fi55ibRZfZ8ERJu+f48QBg+9sBGLPFOnYFYmdazbpTRoerM3OGSG+Il1EsQg4/CJ
 obEhIA+70fZRFy/5xxaI58zXsLy3Ksy8J9vFWfMs37mU1+GMN9KYlXoz18u1n+/sCEusj/eihZH
 DqsV/OGpI36Wb3smgLyGKWXMxXyWSLK15iArFovoaT+/AfFVkREU6aGWYlYS8CFIHpFOqlU9KbK
 6ZmUsTUpPDNE9FZiW/PurcWqS2yrAamJJRFSns41gtSROsGCtu0Kta0AcwUMqCDPBH2FWc0pxQN
 WJLHxzBdnu58YjXByD8A01tF0xt9a4p3Eeq2QXSFWa5y5lEHY59H7mOrfN7t1ABFLG0nBjVn10j
 vfw/vC5C/kMFmGJAW5Q==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abc9e26 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ub4Fp3YvjE6bfjjF_tYA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: 2Iuoc12hD-1TsZyJJF8m4nYFUHMkvKsw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX7AUA231eEDZR
 0HCy0T0Mqvfrh283SBOPnvaezR6V0QT3uzcGgVhuV0X5CjNhrgAVv9IuTTawJYOpE6dAWKucC7v
 RmshtScysZC/7+gwAN5Jn+/FN0vN7XM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300021

> > +             }
> > +             ret = regmap_update_bits(map,
> > +                                      qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> > +                                      QAIF_DMACFG_DYNCLK_BIT, 0);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
>
> Should this preserve the first error while still attempting the
> IRQ-disable cleanup? As written, if clearing `QAIF_DMACFG_DYNCLK_BIT`
> fails but `qaif_platform_irq_op(..., QAIF_IRQ_DISABLE)` succeeds, `ret`
> is overwritten and the trigger callback returns 0.
This was overlooked. Will correct in next version.

>
> > +             ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> > +                                        idx, QAIF_IRQ_DISABLE);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> > +             break;
>
> The QAIF programming guide's STOP sequences describe one more hardware
> completion step after clearing DMA ENABLE: wait for the relevant DMA
> shutdown status to complete, then clear/disable the associated IRQs.
> This applies to the AIF RDDMA/WRDMA paths and also to the codec
> RDDMA/WRDMA paths.
>
> This patch already has register definitions for the shutdown-status
> registers
> (`QAIF_RDDMA_SHUTDOWN_STAT_REG()`, `QAIF_WRDMA_SHUTDOWN_STAT_REG()`,
> QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(),&QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG()),
> but I do not see them used in this stop path or in `sync_stop()`.
>
> Should the driver poll the appropriate `*_SHUTDOWN_STATUS` register, for
> example with `regmap_read_poll_timeout()`, before disabling DYNCLK and
> IRQs? Otherwise a fast STOP->START or suspend/resume path may race with
> a DMA channel that hardware still reports as shutting down.
>
> Thanks
> Ajay Kumar Nandam
>
Thanks Ajay for the deep thought here. This was intentional, on the
assumption that once a stream is closed the QAIF IP is inactive as its
clocks are gated. But you're right, concurrent or suspend/resume
scenarios can be affected without a complete shutdown. Will add the
full shutdown sequence in the next version.
-Harendra
