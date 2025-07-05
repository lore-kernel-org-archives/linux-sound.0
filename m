Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9885D2566D3
	for <linux-sound@vger.kernel.org>; Sat,  5 Jul 2025 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717659; cv=none; b=VYarVuttuFHvS8JhDCKIlJBUmsB7z8MiujHLxiYBam4Qwx8wjG1VRoft+yYQ5kiouHewOGLiAc3junCkrT0qacobkn4gzyjShyX3YrpyVh3aF8Ns/Y63MXp2KivdZhWLe7gUVJknKhxkYu3cdc2IDO6dpicfuwvJO6KEWfq2QVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717659; c=relaxed/simple;
	bh=seAMpBnJP2PohLbFT77DTsSpofMUFtCIgoK8sfHBeAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxvU+ZFs/q0fMUuuvUL4xO4G/Qr12l5UMnUDrsaN2LMnKY98lb5FlRKOsPZuCRtR1u1y9T3SjwTOmkIQAfThpvpRma3XGAnnj7DbH2+fyEMODRRuqBowiFWL1bfcBbIEGoJhYECl6yDg+UPpe+dFLnujvL6AYmVLcijCx0DzohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFEydif9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFEydif9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565AnhGB030113
	for <linux-sound@vger.kernel.org>; Sat, 5 Jul 2025 12:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3R7m6vhpeMmt42NiP+KAtKx
	CzuhYxM1H5OHZBet0e0=; b=AFEydif9Ss2mTTURcUBU6IQoEkmsuLSccCcnyOb5
	VTfAMp/k81ecdON5/NnXvCErPxZPviPlUFndaAHnQVE4uD4i1Sbzx4ifQtzXrjT/
	Y5K9pJQPF0cw2cYIJj6aT5agl/m6cb+f1/+OH0dFZwITCN+T6nPmB5kOyoDipAXE
	OgSFmpGT6bgkGabaM9Qb3WcYP9Ij5Ve/R0Y1C4LlKCMPb7JHjh6jI4/Rkqeo6Hej
	aHZKGa9gGgO3ybFfVosI4vJb5QvstbSz+XCdH8Z/TzzygoCi68HoYHbeGQb/fwMD
	DbuSfiiic+OgQ1jUzyf150Xk5Uc1EpZLoWvKIloW1Lvf1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv970udj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 05 Jul 2025 12:14:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097fd7b32so357671585a.2
        for <linux-sound@vger.kernel.org>; Sat, 05 Jul 2025 05:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751717651; x=1752322451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3R7m6vhpeMmt42NiP+KAtKxCzuhYxM1H5OHZBet0e0=;
        b=mODVNPt7LRHQVWtMLz+w5Lqyt+LkeAUHkkYO7JIomiNDpfmFZx+ylcYI3YB2I9l9ci
         WJzRmSZ0/OmU+fvsBy+iLt7Z37Xc/8YNNW2uKcm71ZMTro7tLZP4SDrld0PtVbDVc4eV
         cpITtJ7foMVg+7nZ1yBLAwUraq2pZcO8Q1NQy8JGvHbrIN3rkDLFrIC/CzAtU4WxKdvW
         A/V06mIvIBPb6OgX/6qEmq1fQ1B9QYwc5BMyGfWyIZ8FcBUerTii3wlpP04GUom3kI2j
         JkorACTuU9vycWusJaG4oHFpM5iK4BPwABw4/8L3Zlq9ABttLPtu3czk3It5ZpQlQjEl
         vnyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhkbj4VEdNgS07o0i7qQg34PSJ8ag+misgNPY98YOHJWx1OomskpzTQtl7LNC7Fx4vx24TAz7sXgzyWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI9SsxXCnZq00C25KH4ZVg+yFAhIzeH/tjn5vg+fMFPy4gfqIt
	w9/hgEaIFh9uxkIxueYuJEaLV/TwkcNO3SQ5cO+1pyqM/1pIUQr59HszcCAhW+5TRk34GV4OXim
	Y53gD/s01chUsBlydqujKl91FMScuPRdML4GDlP7pVUyjm7IDBOdhCRKhr12Kp38INg==
X-Gm-Gg: ASbGncsOqkawJmP84kGjpmxIjlsztRg8vNhHnunFaOvnMAvpXMZfkYeFlQLaucR6fbL
	ZPqcRM39wkQOdWOxNSHR+FKNq4Ok1VvT6p9yqbDbXgm87pu5TUE2N0txhDK054okov179q3zb0L
	VCNK+4bIfC++RdXiY0rdPVPkVA0gjlNyCekAAu+OFnKpRamipC023eoPt9OQ68aIWis+1BQqhoI
	dR7nJMexPQyE9VApVzAIP/ffeofz3x9cFAUGy4by+KgzdU/uChaHsD9bsqvPBRs1M5XRBEj+5sR
	G3AFZzT6zfyO8ubkAtXV0WhkZ+4sG6dv929aGiyhEVnYSUAEIxKJvwXgEkwa2gBMqXOZbf4iydW
	h8g3DGufv77DP6mHbEwIrpggsPT/urf3oVDc=
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id af79cd13be357-7d5dcd07298mr615686085a.43.1751717650904;
        Sat, 05 Jul 2025 05:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOs97+o0jfR6/wUb9M1mhcYSCb6Xy5iUX7EWsEjWj3V1Go8bZKGmNr9AhrCoaIdHHnYr2WJQ==
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id af79cd13be357-7d5dcd07298mr615682885a.43.1751717650180;
        Sat, 05 Jul 2025 05:14:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c485esm562505e87.232.2025.07.05.05.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:14:09 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:14:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: qdsp6: Add an error handling path in
 q6usb_component_probe()
Message-ID: <vyr2uogrgggvk3jrzgmvxhqbgj3ble2b2vwsqfrnbrimg37fel@72766uehk47c>
References: <1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=68691714 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=i8X5gpMj71ElepJM6G4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA3OSBTYWx0ZWRfX5nSTdsnnv6EY
 tuituYQaJDOG02/RUe7lvzAisKzcvFAlD9AZpRCwJzjLEDF3andQbq8bmMveGEbH3To34x34k0v
 +TQBiV6vYKHZMPHTcgF4L43E3gxhypxfp5hVNRGbrl+YdRcQAIFOZff4qjXYbh87EybUo4lBp+L
 0Z3s0FrqrnWrGPUnYdQewHyDHFsf9LwsyzK2Y2JePMPSqbGoQCmLg3Qrwwvp/vJmN3ER+J238/o
 7riKyqafYHJjaM4RlAOz4yzXUGxP0NyPM1G0T10c+fglsMGE5QyIahx+eBzMk1bCqcaja/tG5qb
 aILsTR4L7zk5f4OyWrnrfVjUPDHbezNdRAPGalYHmDwuVwwiJnuu/uXfyRGRDrsw97AF29K0B1u
 F5sG/G+7nKENzQgygWL2GvhWwqe7rKN5E0XM+4SieJ+fBrOhc5DXXoDO2nalVjn1AX8ptmKK
X-Proofpoint-GUID: Zfjw606G_FxeNFVV5ovhX5COv4XNqvbd
X-Proofpoint-ORIG-GUID: Zfjw606G_FxeNFVV5ovhX5COv4XNqvbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050079

On Sat, Jul 05, 2025 at 10:12:25AM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful q6usb_dai_add_aux_device() call,
> some resources should be released as already done in the remove function.
> 
> Add an error handling path in the probe and the missing clean-up.

Well... Yes and no. It's better if we don't unnecessarily destroy
devices in the probe path. I think a proper fix should be to move
q6usb_dai_add_aux_device() after snd_soc_usb_allocate_port().

> 
> Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   - Propagate the error code returned by snd_soc_usb_allocate_port()
>     instead of an explicit -ENOMEM.   [Dan Carpenter]
> 
> v1: https://lore.kernel.org/all/7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr/
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index ebe0c2425927..0d998e872e82 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -327,8 +327,10 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  		return ret;
>  
>  	usb = snd_soc_usb_allocate_port(component, &data->priv);
> -	if (IS_ERR(usb))
> -		return -ENOMEM;
> +	if (IS_ERR(usb)) {
> +		ret = PTR_ERR(usb);
> +		goto free_aux_devices;
> +	}
>  
>  	usb->connection_status_cb = q6usb_alsa_connection_cb;
>  	usb->update_offload_route_info = q6usb_update_offload_route;
> @@ -337,6 +339,12 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  	data->usb = usb;
>  
>  	return 0;
> +
> +free_aux_devices:
> +	auxiliary_device_delete(&data->uauxdev);
> +	auxiliary_device_uninit(&data->uauxdev);
> +
> +	return ret;
>  }
>  
>  static void q6usb_component_remove(struct snd_soc_component *component)
> -- 
> 2.50.0
> 

-- 
With best wishes
Dmitry
