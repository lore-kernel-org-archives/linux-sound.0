Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490355;
	b=FMVsvRFmahBvhPV3tADdW/Y8ODHVqHGkgk9+q+38Nq5hdC0zPrGHlWaTvvj5UKPb62+0
	 OmeAqzYwcVqqc4FirxUxxa8Whv/SqJwobXUweiT3VHLcwEENWNqJaaHcOwX6aLzadYy1r
	 Pph3KGs8XQMsG1aOt6XoKXgPQBbr4guSa9fV2QjYdAQHb1nLWEGTgFc3Fvsdg79dsbqAR
	 eggywN3VBeEP1nZonEi4jJdJd03YqbOXiBlpO89Zpz/cgVeJzQ1caaBhob/pkjENdGSmF
	 8O5EtZilST5ASP6uM+I4AsV+74TWDLEZEf2lkvfkD5A1soS02qhB4kzHEOEQyOxFFrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
	b=wKfLbUHpJCWcnIzO6PHSwM4XPGj+0kMH2D0jJ+LRQA3aQzsfrSFik5eDNcXGQdWEWPdP
	 6naIuGFIzZuNJBRsAV6Yefu3vSJD4ypDOTQBr4B9qC6aaJ9PkcBL65YVQDL7lLeaQw9tC
	 rhYhI2OI+e+3tbpX0fL0ZTJq77BClnPxI5vtZYUBVZ40HgsdTfXvNePt1Tc3/4SP3Nkqt
	 lLpc7b/KwgjFtu5WrEfyxOneiFIw8ZKXwNuJmbFcFbVq74GafFto01NJidwcieR/MV5Uc
	 6JcjdumGqhh0mX1CsAHN98zC9RXU5NeNr+nSSH6yC93PkehvK8EeEh/FNYQrsivIvEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6RvHYjN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5X6P+jh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78FF606A32D
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A78FF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6RvHYjN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5X6P+jh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9HSdo4092370
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=; b=H6RvHYjNNjqOJOAi
	M4V6IlTSok0SApN/vq7rMc9JX615Ss4MbGhL5Hwrp8L9+CmiyJWMimzuAQ9ZLNhf
	mugRDTOTe6gQZTn34iVxh3Cg2g1BkNo790ZpN8ePlPZzUOq1IfmTIGV2POF/5dUX
	R+Ki7rRFpIFo4eCWbyPK7hpBp/Nh5hv5xLUKIC4aDpYXrimZo3rIroK8ByHilqS+
	UXNN+kR9MBE5rRIAkSIPNWzIbtvc4krm/uuFJk8OUb1/rAeMgcGiZwXL3n6GEOnj
	IuHVqT3BSaawMNEPcJB/6foUELfmvcGOwNq+BMCrfKQ39KWT8lyBZ52iYu+EhfpA
	/EMonA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k0wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:32:33 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacd2f2229so4702533e0c.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490353; x=1795095153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
        b=L5X6P+jhJ1RKuVyG85YpHcptVAQtIU0esAwNJmsdXPUKFNdSedOw4BaIrpEkhkCLR4
         0MggITV2x3OWGouZnvMnOMQBMPwLja2jq1DSVGAAtvNs/X6UGWFLR5t/Zcjf6choEzPO
         T5hTQwRsn8azfeqqedN7IrfXKZUJpxPFxqJHmJ3ro1uUPZrciu7gyVdGkFMNUBg7CijU
         eArnNw3+UhzY63rFtXn2/gkiZaQMfwvrjA5YZkUMrpVwpwpgG9IgXMG8kO1Hbj5E9V0h
         J1nALUKDozoylV1HY1Ru34bxX34I+lr2pOuSq4mRyv/sAuTwA6NFcuAEkCsnPysK7bGm
         0Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490353; x=1795095153;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
        b=Gp9b63ozNBIe3IADHOCJ84q0Zaq/VegyjWzMvGWZtHwA2yPDMTmPkLnRb/ZBeLm1s9
         Xhdm6HtQxgRJqAhptjhuP0l6qvGtvDkedPfrN0PJSuZKTbCDncdGRME1hphfQUKUETHu
         qdYCuc30g1iT/wuV+Qm8vFE6/oiKv1j0x9MPgJOp0sN0tYLBhOMAjWBjwBpuG7L5MjKg
         wPE8pORtgeVvahTbx5k9o8WkcdNeIfYtCnQQ4y/EDX1NwxRkcQYXelrQAkpX5oMw1xm8
         qHRT8F8+qyBW9YrRAiIQxAYf7Y71UUMPVFzGXd0HVHV+NMUTz7z6+iyKrOVjbPideslr
         RkJQ==
X-Forwarded-Encrypted: i=1; AL+hErFlKCERk0SMusem7nqNP/S9SACp17vfPk1P0P1beNvMir13txj1VF+Nf50cvuXn0rXoKF/a/oFcbVgZ8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8sQOSOxFjD8BUjgdj1RekouWgF52nn8ujIte11OvfRqVbJys1z
	wf6ox+wA4nw4dXPWW2cFsaxBw8O8snu49Nfwx/TdSnQhC4Hw5BWbwgssDHmP69OC36WHlu3Ggpl
	0mPzqu+jqarIlK9Vxo5hti4iAw1g0Jtv8qqLtr+kqdmewagz+f+l1f5bzCynUicE+gLLQ6POVmw
	==
X-Gm-Gg: AYBFou2K+2EYywRY7aRAq6Ew6Pfrjvvyv+spVH45CUkHRf+SO0KMgQrMw8l3Jf2C66V
	z3nZtRkZ5hbznacOSiaAIwXhS2dUSJPuYf5IM15J+JitK2yTQbZs5a8sXq8VSbTPqYXkoX0TUNE
	6RkwTQxGLBxpFSnQVSV/M+XY15Ztc7pVz1EFoZbGIuhf7zrl2TtCdENE23C6BdMlXJG9ZjbWEcW
	Sz/LQsBdtWS9pCcfE6kYmIrQmJyS1j1G7rcGD2cMJZxRoG30GqFBFCZYN+OVTWsvrSvmHHZWN1k
	p0dfs/trhyUfvwwviHUFyTuhexD9KX1BUlUHxjYnGnZrftd6YCrShi9u0fDwhlo0A3DQHN0g6i3
	qcKykkJZvZFh3P41ql3KsFT49N24BDbik+YRqEVuY0YO6IH1XLzqKKSAZYg3FkgbZsRgbgPPfny
	uukQ4g9ckns9qjXNNfgXVEPIJz8j/SFquqD+AM0SjJ2R6/9mNm0YoM4BzcHB6pZ3Tf59MJsMJaj
	rIKKl/UveEBRGUCRc5VF/6lEUXxzldB+pYEnMqjQxIO
X-Received: by 2002:a05:6122:e153:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee1c4862d1mr2361245e0c.23.1794490352756;
        Thu, 12 Nov 2026 05:32:32 -0800 (PST)
X-Received: by 2002:a05:6122:e153:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee1c4862d1mr2361193e0c.23.1794490352219;
        Thu, 12 Nov 2026 05:32:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6a4195sm339950666b.86.2026.11.12.05.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:32:31 -0800 (PST)
Message-ID: <6876daaa-1e9e-4f69-855f-53dfb2b8a7ee@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:32:30 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-core: start rtd->num_components at zero
To: Mark Brown <broonie@kernel.org>, Dennis Gilmore <dennis@ausil.us>,
        kees@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, gustavoars@kernel.org,
        linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
        nuno.sa@analog.com, dlechner@baylibre.com, linux-spi@vger.kernel.org,
        miriam.rachel.korenblit@intel.com, linux-wireless@vger.kernel.org
References: <20261112025252.71375-1-dennis@ausil.us>
 <179448342405.66517.5463730214277229760.b4-review@b4>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <179448342405.66517.5463730214277229760.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX9r2/VrWeAZXD
 Ijjnunf7Jif8DSGs2r3rjqbu73fLm5pgawkowTviB2fg6wEj0gB9cGrnJfC37ncmZwuI/X3EDOX
 vXwMZIMXJVJCyvv8sHbtH7qneXHsEw0=
X-Proofpoint-GUID: ULhkrSJfy0eKohOdV7Xf6oqJMOIuTo7D
X-Proofpoint-ORIG-GUID: ULhkrSJfy0eKohOdV7Xf6oqJMOIuTo7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX2ba7v6sBCoTN
 +2dpxM7syHiWQaaqoWx00QGhv2A6a1v47rW6tp9NTIJSJ2IexhWUNUriie4hRKS5976Mp2S4Z/A
 AGrrspUups9zNueL7lFPbkhON9pRHN1dmZPtCTWoCBFx1SQcFSjkMOF19MWwB1s/1jjrK/rVkkE
 qCEp2LccQa5LvwXPaZHncnYAIfIi/fF6/L1Orj4whdmDGJklxbAFWKY/c09603qlT4qG3UzxqbL
 pe5QeQrJIdqL/Cu5lNQ/ij7qmosyVohQOMAPPicK+2a2Gz1Js/dR1xk4yv8aap6vZMggSh2mINb
 UjLx3t6z9jjrYGXmZx4b+JX4iKU1ZCN8SM38m02hzvnrNrCyXMf+RX25MMFv2OzqG8JCV1O360D
 aACujx+UREqV5Dq2KSnptMTDSRum7jYi6T+oy1jFubk6xv3RL2JLucQ0X2lcsU1EbNfREJHNQJs
 jlXcSMfZVy2IclSzsDA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5bff1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_62txuixjVeDG2zLGvAA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120053

Hi Mark,

I was about to send a regression bug report for 7.4-rc2 but I first
checked the list to see if a fix was already available and I'm happy
to report that this fixes things for me:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Also the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

On 12-Nov-26 12:37, Mark Brown wrote:
>> Since the conversion to devm_kzalloc_flex(), the allocator sets the
>> __counted_by() counter num_components to the allocated length
>> (num_cpus + num_codecs + num_platforms). This only happens when the
>> compiler supports __builtin_counted_by_ref() (GCC 16 here). With
>> older compilers the counter stays zero, as before.
> 
> This doesn't apply against current code, I think this is an issue that
> was already fixed.  Please check and resend if it's still needed.

This applies cleanly on 7.4-rc2 and fixes a regression breaking
audio on a lot of different devices there.

If some form of this is already in ASoC-next, then that needs to be
send to Linux as a fix ASAP.



@Kees, have you seen Dennis' remark about the

