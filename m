Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A313F0774
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411486; cv=none; b=V4hznaUgqvI8YzzA6AKse97h23nFu3xPu4Cz74GfMuOusbcgVpo2QaTbkt6WAZHCZTXDWoqiql6ENaSjTt82gmMtR3GAObZGN8LhBOkly5k3m5ERgj7Hw5yc1ufbXbNO9Ri4mU9S+Ul6DU6NVB7HEZqKpIRtoUzBbnfQ5am2Jjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411486; c=relaxed/simple;
	bh=JGSh5lAZ01h4V6/aN5YEeVciZCInCwqxQ6QqUvPGo90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiAxSmjzfeyD9OBCCoFDFq8eTk67c5ttMBM0162PHFrr+ile8VX6/k6lh92XlvxhthJLRlQ62zcklVDbxxgwM6QAGtDA2pwCCsqSCxT+Kl36zjtSoAqF/XJX3jdwziJwaLdGUlkpGLpDWMt3zyuxEQYirMOSmPStouWP4LWeUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHY+9/iE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3Br/Id7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHY+9/iE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3Br/Id7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652BoC1D1316771
	for <linux-sound@vger.kernel.org>; Tue, 2 Jun 2026 14:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1qut49VqY6kixKrk363RsT3
	75KtaT3Dj3vgJwsvmMA=; b=BHY+9/iEQsfwnfFkozleq2w3xaPvI9jJpUfv9NRD
	9vIuRgUkEvPLCPdiWlD0M4NVxPar7XJqBHX4V5nxT8LBDbkSj9a7EdiFSxfibu7V
	btJRt8ioDdDgKZOLU0OI7HpcS/JQatOecRMeGvWtK1KsvB+fE2hPsb391s4Toy5I
	Yea+abZIfmOPW79A3oHkW+Sm1/g7zGEdL2BHAvgZBj/1otg1Aey735G/FaYIojVB
	xuH+jYHnuo3x3bmzFL2b7vU43vjZUpPmrjyj18jiDqZlAyT6hokevSB0pCv5sEUp
	UUbz0NIZ0Wgb1ZAevQh2KqNKDCXgzu+9TsDjpXfBbuZY1A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vt3x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 14:44:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfe512e871so1257694137.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780411484; x=1781016284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1qut49VqY6kixKrk363RsT375KtaT3Dj3vgJwsvmMA=;
        b=H3Br/Id7H4q/WFdNqFVVAorPjfN6UEJ4r4YMHg0Gx4TzIR/6OaXh5HlzR3H3XW5Jkw
         Ya7TUhMaGQxRtzBAB/odYY02eHuVew1SwaQzQPlpFDb89fOIE1eRtDXdc5tCgAN1TRp8
         0/AoGwMzt9yqElQ/B6QDWUVdQajBLw74TCAj0KWhL1sp1N6AQQtX6RpM9461EL9W3xE3
         xqgxirZTPYQMxH7sKI+BGwX+t8m5dmZKOZ6jG14zK0rzq3Xl6vO2kGToWXRPSJ17+my9
         l4wcQkTKEvP3k9IEje3sQARCilLHAc5QORGfNbUV3ApLHWEDWsL0GMKBmB8dt8Jfbbjc
         Qciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780411484; x=1781016284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1qut49VqY6kixKrk363RsT375KtaT3Dj3vgJwsvmMA=;
        b=p7zc15T0EqJfDQd0zvV5ZZeWTtoFiyfHmty57rpbPj04Fnd/gm4kVWFKm6PsSAiQv5
         XM0dQpSvv5OOsrBDusTlCwItI72ywBK9x6AF0nSsFLbqMcyXbGylA6XOdNnaqcQr22DF
         jxWW5XI1baAPAwkombeVY1uYYGWzWkD9Hd4/1k4aKYcr/tqgX5nw5KmNEVYO6XMJk31r
         gAIFdSv2REUwQu6FXd8dlYYHqwmZpHWYOkyoprzi04g7InfFDmckhxxdrSSqY1hQB50o
         ezFZE7wmq4rcyB7kgt3tkKIAzVPBgo+J5E15gnA6VmJhIdm5IDnqNuD6eey71Sb9FII5
         Gizw==
X-Forwarded-Encrypted: i=1; AFNElJ+yseqfutbelZGdYk5byAJRSdIwR0HnibHKeeDOOnpwV0TRsZo3DNODSbCvRLvy76r8FXKtbdCVsRhivw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaNXWSb3KPa9jdPbTH1RgYDTaiIVwdDNVDel+/Eb0YvRn8K7NL
	Ale0IhLt5Rm5LY5BI2vLYo5UapdKBsGcXNoKD2xtuApl3ftEd5swPN5sXdb6OVgdqHwLDjdAvzp
	OF8MGAx5Lvn9JVyw4sUKSjjY7toGBwAtB0vKEtz0v2bqWQ2XKB1hZFgLPjPa2pnTF2g==
X-Gm-Gg: Acq92OEbzyRVAoHULSZHt8VbSGvLE1J/7hc5/4TSR3IZd0awibdv/5GFwysbZ5MSMqK
	kb75O/rhb6ZPMqH0SVFEro/0A0pB37lUIMHcEE+frD9qN3T2sHxvnkppd6pgLT/s7hof8IUgpjC
	aFjTwT7qp+NYlbuBDMnK98348GagNgaj7ohEcRwsyl8h/o2NkKwMTDMfpZHvrThvp+V3B6XcCOa
	eNAOZ0OQYpRMJXF8GDcno+kYnZxKzcGwA7b9Giia2FKKSPeU1gJhhFEu12phkQ2MCL5rLYCzegL
	6iDUKcaDRUwFXEtiXpxqzAPcGnY5vcLAf8MVpY5Iirohj47NJHtYBc08FryxRuydLP4GLXquAew
	NyP4Hvy8r43wQIFxMKC4C7uMJI6w6OHX5eFA06sFjuHxSNrfJhYpShU1QaPO/yNC9HBk=
X-Received: by 2002:a05:6102:3753:b0:604:ec90:ba14 with SMTP id ada2fe7eead31-6ea1ff9867fmr51537137.11.1780411483784;
        Tue, 02 Jun 2026 07:44:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3753:b0:604:ec90:ba14 with SMTP id ada2fe7eead31-6ea1ff9867fmr51511137.11.1780411483296;
        Tue, 02 Jun 2026 07:44:43 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03709sm1166066b.30.2026.06.02.07.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:44:42 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:44:40 +0200
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        thomas.weissschuh@linutronix.de,
        Arthur Kiyanovski <akiyano@amazon.com>,
        Rodolfo Giometti <giometti@enneenne.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        "Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev,
        linux-wireless@vger.kernel.org, linux-sound@vger.kernel.org,
        David Woodhouse <dwmw@amazon.co.uk>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [patch V2 16/25] virtio_rtc: Use provided clock ID for history
 snapshot
Message-ID: <aupnwe2y24oxejpkjnlbzlmdiuuzlbqlahofgzipxwsnoir4jd@cwgplvoe46ok>
References: <20260529193435.921555544@kernel.org>
 <20260529195557.744271454@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529195557.744271454@kernel.org>
X-Proofpoint-GUID: eueRsUglyz7LwBmg-UaIsLtKIkivrWSw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0MiBTYWx0ZWRfX6DlTdvGb7fZO
 qQiIQLN+wnB2+xTQLSl4o+Bb+xP4ay0htSBUaWX9+oUbIq8tiVIMcYE4v1e9FHmARas1tUtWsH2
 U8Cfiwqa1ttL3exYFEL8mMK3a0xWZYeS6+ELTbRwFAoQeGgub84cRaf8rRCPFm74/MLazSdVbSR
 LtYhlu26lIPlahq9EpYGGeJKAGuJETi/geBZ4fuQ/II0A2j9IsO9+kGPZOyLnNFOTAPg5qMaHg2
 zjOZD04t/tUsMzmoTNWUC4+j99bJMIaVW2S3mgObVaGkhSVtk+H2s17Rly+mjB3LA/Q2ePjTygy
 EVsEUOopH9WBBB92BGxkh5queihlgpsgK5khs2ia2VyqxLLalmukFMG9grUI6SeALvoyt7aOfcy
 iJ8500TsVK4ofbtUNmqNT8CQrYU6XYoyppPI6EKhbifEVxYGORomJkFZohSM7no/VTXdCA4CDup
 BvYGkvqGBWYWvYfxW0A==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1eec5c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=vggBfdFIAAAA:8 a=pBOR-ozoAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=KhUNALZX6FJHKvLdx2oA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: eueRsUglyz7LwBmg-UaIsLtKIkivrWSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020142

On Fri, May 29, 2026 at 10:00:52PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@kernel.org>
> 
> The PTP core indicates in system_device_crosststamp::clock_id the clock ID
> for which the system time stamp should be taken. That allows to utilize
> hardware timestamps with e.g. AUX clocks.
> 
> Use ktime_get_snapshot_id() and hand the provided clock ID in.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Tested-by: Arthur Kiyanovski <akiyano@amazon.com>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Acked-by: Peter Hilber <peter.hilber@oss.qualcomm.com>

> ---
>  drivers/virtio/virtio_rtc_ptp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> --- a/drivers/virtio/virtio_rtc_ptp.c
> +++ b/drivers/virtio/virtio_rtc_ptp.c
> @@ -139,7 +139,7 @@ static int viortc_ptp_getcrosststamp(str
>  	if (ret)
>  		return ret;
>  
> -	ktime_get_snapshot(&history_begin);
> +	ktime_get_snapshot_id(xtstamp->clock_id, &history_begin);
>  	if (history_begin.cs_id != cs_id)
>  		return -EOPNOTSUPP;
>  
> 
