Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683413;
	b=1AQbOfaH0qlZ7ztZGn8Q8ZPss7qCkXwrCJmeH+q1mpKFCaUqlAwpPSb0BD83733ylytp
	 CDymp/aDBACGPJaa9kohfVX1XM/Vq638aywICezQz4kc6i4zAUi0lHMyZJYyRXuzrYrAT
	 C3s8ReR4kNG0lCumb6/hbhbKF/lzqDgZ1vmwPUQfka/v0p6maeRH8ZK6sx6X55bVbEHlI
	 S6k/MSj/d9DxCCO8Rq92xAxhnIiUtltjvqhf5hYRP08kRp8tQIHZEEPBcjUi3NuZTKYJ2
	 LwXV7HHYQ+lEFIXHQAjbT4e03/VpUHStlK1YH/xm91nTPZYkflg9XNmhlGLf4Up1o/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
	b=SaLl7VIHgSPPJrW+EeFgWBNM2INe8CPndcBsCNn2lE2ZYkRc1tImrkVdLynpj4uWahN2
	 0zFDFXZM6lBhlR85Wg250yflrnIdeKcJIiDfpp8GWNjhZi4ARuipevrwcnGeeUX0chv+9
	 MxKhosOC+9qpDO9NImXhMittJT5JNPv6FmHKolC3qmkEBYnSylfa4qdWqlENaGWkoSe0t
	 2YG56BY7XYY0Z5yoVW18Jb3orVh1gSMYPA3otbgog2fMDe38vc2APRP1XdVFoLFBDwfp5
	 ToPEnqb1zecfk/pz3sqthSe0h/UPHDMvHdOjEIqejOSYSU5ab28CPEdTYpkreMjmwEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmySYio4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FS5KsC4u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57F606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D57F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmySYio4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FS5KsC4u
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B6Nt3548371
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GdAeT2uzPb1MI1Dd2EoVov68
	0FDkwR732zQnKIcOH7o=; b=BmySYio4wd8cI0/sLlw0Wxmdt+mHmtNTeoFQ2VIV
	w+1dHvTgG7ic/V1JDSUHPkrXyovd3mFFbpHuh0Sl3/vufoeqZ0wGEsQ+NhBoa4K9
	9AyhgLwPws32CQjVixp9F/RUqEokZR5yH9mo35c5weqRDA+ZwHndNuGXHF5tRbV9
	VCMqdkwiLp5o9MbTfd/nckN17UqNIp8u+kXpXDvsOfBTrWlLY0BdA0ietklKYdDu
	rG1t/Mchoh5lAzmx99TD09kmcR/NPj/GCP6oU3Bc0vMmZ6MO/dc/iYmT38OMlNed
	2j6JweVSWDLxDL8jbDWxHEpLe1jPgSKqCB44/jlwMfUl4w==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vau4r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 08:56:51 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67e05bd44faso6594364d50.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 00:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683411; cv=none;
        d=google.com; s=arc-20260327;
        b=Vx2RldFXLE29puzrta6c2LKvcKV2nFs34LZk6zqtJagn4ewuyIr5fIcJf2DKVx7ln9
         dH3M/8R7Q6eJjlfY3ZaGYQOQJMTLY+s+jRUx8PdZjMpu2Q0h5PFVooOswqDymUGee/SK
         sKAvfgTRro5VOlSFMaN6H9v+vOvGpdTtuToFzsCGg/DcjdGLaLSymQDy20EDtW2sPqFc
         7SQMk6g8Ug50OgMfhT0NkD9ODk5rQpAB3XvQiywyCwaszv/Uthje/ot6z5oY826cfPLp
         4SUO8sjt238K9e0gATKVm8tDjOlGUkjiA1rin30n5a/usC6G7iQdhyvNbR1GajxzHUCB
         6ttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        fh=uFUG7JZFlQsWrVfYSzapoDN7PgMnoMXTjUGCeG9plUk=;
        b=BTKLFnM1YYi+mdZPRPbR+TfC/HJESti41phc12B+tMUZ90IRQ4Kc4q5uqp1HlhkEiX
         8hwoKjce4vya83mc9dB39TqSFmNvJT3g0oLqfCi5cJy24TypUJRM6x/jy8GcbeQStAmQ
         quG0Fmu6MPckjYaisVLzYiCqRc25VFw5QIY/kfShklLIWE7rpNTuZYTFMLGCbLJys7nJ
         9IOugoY7VqRtS/9LBw9tINpH4Ea4TXtPo8AJSQuFB0pMPJ8SWrVwp1OEjUNvu+8s9JVI
         gYZu25lRhwvweYnSRsjan+LpdNsO2/X14+rzeO4GIqHeKHT0vIGNR4q7/mJniyjQytAb
         QYYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795683411; x=1796288211; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        b=FS5KsC4uaNxsB8z23fHgO1q+k6nVhRWWW7JnlrhmCFXyWuK1JWM85JDnZvZ+gcyrOH
         B0zJXzEUest+MSdKZCJqOLh+tuzIC2YSUWKBK/slWdolHNDalZTaygIeZijlkYxHv3YD
         PS8ni/GVnUTv/WxEDP14AKqyqdYUBydGXTvKD/7Y7GzlUGcgLdZ98vUtLSrzQFihgKJM
         HSOwYfKndhX3uvL2Kl5ELjQyL6++gNThILvAa7SL6IAbVfZ6ZS7ST88G3is/Pnx8EJ2A
         AjwaLZdiAgt2mh7kgAEub5o37OzEDFJ5ZxKdDJKIkPphZTNiu/d6LpAFXLXjHRX9ByJJ
         cEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683411; x=1796288211;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        b=SWX/xDeOMX6YpUr/M4b6tGdyYtZLOhWAG6P7i0ss+xL43IWPC2YLmzSjmgwKsl6aPP
         Ypj2ScEy/Y01gstNrg90zBaC9MUz6uVUJiyP4pfizlqMr/zxvV2VlukJ/NVodGIN5Mmt
         4raU85LD2B5uGjis4WfYZ1+Ru6TFhXD/GUNnaPBi8V+xv2qOTaa7qeA6EpPDUcMdbFGV
         WIVtl/Ej1RR0LKaCp25qhQ8qLF+u9eRy34vSprdQ0ppCHjqNmZLcOcWOh5blSMKgxZY2
         oNqIa01oNtlWVWman0GUk0m1j1l/5t9XX+sZoPRr/FBIcz242QkKNTzXwdgtd2iZbBxu
         XniQ==
X-Forwarded-Encrypted: i=1; AL+hErH0wCvxj/eJlBFPBJtXI3bzJhjwy6y5FY8HeWujnoRH3qgjtqDRwrY9oZxrc8ifLCifMt+avfTkADnEOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1dB21mWbvUB2grm8+ObWuuMBx2D8EmSINZVocy3VzzLtNQI2Y
	03D4NEYbpv71GdIuR7FIY64IOt7W/6UlOgoknsLd4JPJvZjL72jY1nYlBDIPlq9c+l2Mi1nS+Ba
	/WeF051OHBt4AI/F5gEIuayKYrPqf5wVR4XeQU4HnRWGq++HHBVI0WM6OFIiB94C5Ztb2X99SE9
	f0dQuKfBoiyEtTXdVx1putqqKy3op095++6H+3CJ77
X-Gm-Gg: AZFdTZcg4/IFHi46f7Ez8n9YkaW2Pylyjy0FjFSw144OLgyOgqrQFoNWJTB+CbnSTFF
	30qd7EdMe/MxKLkxViLu1YMiyU7gl6coKIaYm96H5+lq+OJTVR38S0+P5gnBrxtsv9yW/HKZbgx
	Y4cIV/t2AHxAugSdWqykGltpHq/ra2Q4d56YGcjLJ0nG8zent9lKkYAWu0QBDPAWDi910BBGROE
	6rI/ZbS9cy/kwL0VQ==
X-Received: by 2002:a05:690e:4384:b0:67c:2b34:31a3 with SMTP id 956f58d0204a3-67df4499656mr4524840d50.104.1795683410715;
        Thu, 26 Nov 2026 00:56:50 -0800 (PST)
X-Received: by 2002:a05:690e:4384:b0:67c:2b34:31a3 with SMTP id
 956f58d0204a3-67df4499656mr4524823d50.104.1795683409171; Thu, 26 Nov 2026
 00:56:49 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
 <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
In-Reply-To: <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 08:56:38 +0000
X-Gm-Features: Aa3M54qz04OSpkfl1fvVhCmYpAObBtZsQ0kjRELJJmyBWonCoo2wb2JsmKgjWbE
Message-ID: <CAPnEM6aF98vbebMhCU6akpsoVzjS0pH5xcurmEsekWw3RF1vMw@mail.gmail.com>
Subject: Re: [PATCH] soundwire: qcom: Fix off-by-one error in port exhaustion check
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfXwnhXMD9te+9r
 74fWLXIGGc9KxDys8uvu2YjUMXH7zhtU62CMoCkcii6HAz2uaUJyhjXobGMUQo2H5L7yjgJCdz0
 3ml7Llc1b7Q4auYf+uJBsURzePrLv+Q=
X-Proofpoint-ORIG-GUID: zkGviBARSsuyjfg5SoW_x_YOqkyqaymR
X-Proofpoint-GUID: zkGviBARSsuyjfg5SoW_x_YOqkyqaymR
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07f453 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=rLSoK4kSsnz7ToN-XvQA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX6H7G4/c8E+vl
 SBS0g5g5J3k5T1HbTu0yev3hpiF6P5b+dWRjWyWvqRM0vzNq+UpM/qwnMO94KkGHTUP2onGXUlr
 xIaU5Nrex+MWtD5Z2zWwRDqvxXoA6goaOhRksSI1/RQwqVwQK2x4iExnUBz5k9gtJb8cTA5iP93
 7e9hmLVfk3L4L117NmQ6zJvKxM0ZeXqofCL7lMYYiHZDfA0zEBIJULk4SUGXHeNAjTuGFgcisf2
 dyfhQwqoYkuYkPsdPoZx7wsPV+f+arbPI4OooSVFUdqVPLLj3WDOpbmwZrtlo4dlpI/XX9a0dt9
 2QVkBlYK1efXopE6JQOwFqgF6zHVl559N1bEBnRVcK6SDLqOxAdz5ifWTOqvZVa3hJcbGyZtLZ4
 SK4G0pWG+11bPGof1WHPWCDGUHZtyshjFRWjQtVZvFn7zwEWp2aiWEoy03jfDA6gnOYTqmNgcl+
 ZIf0Dvp0ANaTtXbDAPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260034

Hey Srini,

Thanks for the review! I got some time to send a v2; it should be in
your inbox soon.

On Mon, 19 Oct 2026 at 09:10, Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
> On 10/12/26 11:17 AM, Christopher Obbard wrote:
> > Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
> > port_mask reserved. Valid port numbers therefore range from 1 to
> > maxport.
> >
> > Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
> > stream_alloc_ports") changed the port exhaustion check from
> > pn > maxport to pn >= maxport which rejects the last valid port.
> >
> > On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
> > to swr2, which has 8 ports. Each amplifier uses one port for playback
> > and another for voltage and current sensing. The right amplifier's
> > VISENSE port is mapped to master port 8, which is rejected by the new
> > check.
> >
> > Since all ports in a SoundWire stream are allocated together during
> > hw_params, this causes the stream to fail with:
> >
> >     qcom-soundwire 3250000.soundwire: All ports busy
> >
> > The codec DMA backend then returns -EBUSY, preventing speaker playback.
> > Disabling VISENSE works around the issue but also disables speaker
> > protection.
> This comment is incorrect, we do not have speaker protection enabled on
> any of the devices.

Thanks; I've reworded this in v2. This bug was found while testing
AudioReach userspace on
RB3gen2; Speaker protection isn't (yet!) enabled in upstream, but with
AudioReach userspace PAL mixer
paths enable VISENSE on every speaker stream, so playback fails unless
VISENSE is disabled.

> >
> > The original fix addressed an exhaustion check that could never
> > trigger because find_first_zero_bit() returns maxport when all
> > searched bits are set. Include the reserved bit 0 in the search so
> > exhaustion returns maxport + 1 and restore the pn > maxport check.
> >
> > Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
> Cc Stable and Reported-by missing

Added Cc Stable. I found the bug when testing the AudioReach stack so
no Reported-by is needed...


> > Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> > ---
> >  drivers/soundwire/qcom.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > index 6e0c5fb10efad..b4ce96792fa94 100644
> > --- a/drivers/soundwire/qcom.c
> > +++ b/drivers/soundwire/qcom.c
> > @@ -1348,9 +1348,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
> >                               if (m_port)
> >                                       pn = m_port;
> >                               else
> > -                                     pn = find_first_zero_bit(port_mask, maxport);
> > +                                     pn = find_first_zero_bit(port_mask, maxport + 1);
> thanks for adding this case, rb3gen2 should not hit this anyway.

It does with AudioReach userspace, which reads the VISENSE port :-).

> >
> > -                             if (pn >= maxport) {
> > +                             if (pn > maxport) {
> >                                       dev_err(ctrl->dev, "All ports busy\n");
> >                                       return -EBUSY;
> >                               }
> >
>
> Once those are fixed,
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I didn't add your R-b as I would like a review of v2. Hope that's OK.


Cheers!


Chris
