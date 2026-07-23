Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A443A37E2F9
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784835595; cv=pass; b=FKDAYL94YLc5f7O+fiIknR10Wy/l1wYMi9q/rSglr4jqwxo3c7PLMkb05gAn3HB40Vq9pDvv7mzcMArEQ+d9n2uCMnW9a/1EIf67AwyExaUCz/Oq/KlNN+dLO7hvrkUlji2UGLaCYExW/qYzxdSJhIXSRJvXwfdSYLWg5Alh1rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784835595; c=relaxed/simple;
	bh=OjmerZlh2Ae0w/xoRAIqaoUMyxV5HsJ41pwEyuiHBsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alPPXPEC8UwMcLXbhd1aYktOpIL5h/5t9BqAK2niFlcGd2OvwWVY4jVIjx/oh0ijhZYAJ0uumlWdvRFA2nb6vhGNrsn7JJLYyMn75Ep/u0l3lPa8YwYE+K0UFEd7at6Qanm7Xo9YD/OMWZCuGOczraodsnv3uiiPXRpuyAf9o8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYT7e07F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaIE1ped; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYT7e07F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaIE1ped"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImGOL579769
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 19:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k7gjuT0+aFniLuCctCVMtzeg
	Qak+FZ7MzxxwdoW/+fw=; b=DYT7e07F7hb6HKcF6rLsSLvkEdUzswrmLe3B1U6+
	5IkwzZGdx1bJrWgoPufsLDZE2P5l3TfGFm16G2CuMXDqf4Eq/ohaQzgnKQ9cJXEQ
	11w79+EX5NBwG5bHHR73GQ/FpJQS4P2dxzhEj7qwq2NYHP2PfvNk1DbmXIXzNPIj
	/ObytEmQmbI1U15aoonSVvYfk/IsyfFyo5QiTbFD3/zGcw85l5VTGFwCzyuzurbW
	WqGdFJfR63jSfvpLemOgFccaGLKuF+BrhD9gfplpsL51ssng/5S6Rf55rDIAMUGp
	8K9xTK+g1NWN7xj8P6/MwB9lZQ/iXdwqwBZzQan/OgU8kg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnua2yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 19:39:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso750889a12.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 12:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784835581; cv=none;
        d=google.com; s=arc-20260327;
        b=FbuRkfeNaoz1uznl9H5A/W8QU+DDZ3AwqaB2bDXZJhpA7GxmV+dO+hGqL3B9kUPxD+
         9xy3mYZfUnYG9GEB5oVn/5H76OVsWPYroYe3LDcOwCEnEy5YCJPhOOZhhK6AaRtQ0esD
         DWjNGi+T0Zw8pGczcWLHuTzywgCzz336cGIuP1jAssA9rS86SK0ipVTULr3j7Ac5UJK0
         xIRiena3KgUse/4IDRUduk8vvwoI1z3tsia44d/oYY1l3tebS6Drxme5Tdt/pJ8yDTDr
         r3DRqbDkpbfoYUBpdSchO2zRFVdufIKK0pLHEeGNooLZ8RBK78sF+eYOBzNvYvLHt3b/
         CuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        fh=7CYFs7GObdIAPlbfwRx8cQv0rS6xtTBL5U03SiZSFLs=;
        b=BiBEt8MQlByO4rafpsfraYNZyopxHa9GKdQupl/BB5d0hMLyIvI0tv7ei4Z9uezoX7
         8OhghWhB9zOU8AXmMRwCHtDxMf0K/NChu9SqylFPgLcei2AXTZ4RQHWKwmg1Ah6otJQF
         6UKJuxPrQewTbLhYGAogiOclyaVy0gE3KxrudFYS1o7a0YV17/6wyHCNQ0D66c44MQOz
         mJfsX+cSXRsvcRjYDDfKSiY8h+9s0C+6sKhepYKZiTT5nsBxt67xo840ITs54EZ2dXi9
         H7/W6SF8YZMbgpHQ5Hd4Lz9sdzRP0sMkIf7CVcLkGIDYT+tMaFHT1Debcff70b/t4Op/
         pgcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784835581; x=1785440381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        b=gaIE1pedS4aRUGz7B8icVfdQo8WnLNkeo21uw5b3UYqH2QWKcgyicblb0/1t9vl8g3
         N/F2nIFUILxT/+EKjHJS6+7GoUtSTQG5LKawzpG6Ew8J9bftyLeO7qvqX1fJ43zjLbyp
         Hmi6T4vF36X2ENltc6NMiFzTMlum2T/07tJUi8vUKa5A8GVNqD9+v4QVBtz+g2qSOaes
         kaE4iuNfo2QkO7HvhBWMcmPxRmSFXNYjTYdUBEFUn5QXz6MW2WQn7yIyvu8Spb9kd5Wz
         KnZWBHYIA4v+l6/8U5I7lTe4V5LmdDjeIwX7TdYx4YIrZ/DFXLDcgpxPpJO90li+4eyt
         +2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784835581; x=1785440381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        b=kuPyRH2b1jOaSzNhEx65pK/WHOy7zHmhetdyCLyZCi+FpEyjC3WLmbJGB9JjbyC6dB
         V8RqBeqffPTLbwVJOE5fAMmZYU7Z32UHeYH7XqseJrwobVbRBFumtRQuWNtte2osBz+k
         z9qEFMMur45eot+CMqEv4mFZMIAw2Dnhwt3pHVej8RJftShdzVTZDeZg4s+PRPNihBxg
         mzpMQ85A0xJug/9d5wjBDayh7Q23hXA6n/wkFwFxKPpRA2xdKhYe7Ttm5m4jpcDo9/Wm
         g7CL7BDyNlLCjrflP24wMngzxmUlhMKWCk7A/BLrgXOH/s7bWgvEuL/ISDX0yYPe3KD3
         18qg==
X-Forwarded-Encrypted: i=1; AHgh+RpYNWrNfS8b4eEDYeolKOqoBKByuARuBqljiJfxAMvOZfigSLCxfMXx8qB8BgBtulbNp7rjpzIW/WU/QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzngkdCUwz3ALeljeUadf75XIFkHy2zry24Q2nBwe0C1aZJtxuf
	TOjJqddvvWLJ1BC7k9PH2fWhwF7lGx/KWfUosE13nhbA7UH2pLNxvz7yczfhVqKyykvQp5Vo9z2
	Vkv6uYG0glZRS7pA3e5fsAxlJ4N3uy39nqiY/HlYnQV3HwN8YODOF8ZulUbapWfkQU/LQ978sXC
	46wslg5mBSOW3Ndkiqwm0AX1oa866Ga0QMAx6Frd6T
X-Gm-Gg: AR+sD106Wtqk8k8i3XRBiRCLVbGebbwYVoh0DUxO81uUx70tUDgzGONwFr5uHRJhH9W
	fEbqk0sh1fjLoU8bp4kCi0ZmGUK4dwQN22QbpYd/M5J9H8pEh/MjYGswK9cySl/jWDWB/M/pmwH
	7yDYejg+R/Io42PdrY/O4PV3agiVfjHuxX81lhF1vKeeF+SPzDk6TUrKAA
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cfa6c7884bmr52774155ad.36.1784835580621;
        Thu, 23 Jul 2026 12:39:40 -0700 (PDT)
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id
 d9443c01a7336-2cfa6c7884bmr52773955ad.36.1784835580214; Thu, 23 Jul 2026
 12:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com> <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
 <6a625f94.4d70c427.b2b96.9b5b@mx.google.com> <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
 <a6f86d96-48bd-48e6-9306-159b17380ff8@sirena.org.uk>
In-Reply-To: <a6f86d96-48bd-48e6-9306-159b17380ff8@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 22:39:28 +0300
X-Gm-Features: AUfX_mxHE1J6imuCX4kEX4NevKVebUAQ8I-BHSXEMNlUFDgV1mwWb5gbYYJ9FqY
Message-ID: <CAO9ioeX9LjGLwKGFj5W0Gwh8X8_+E1e81Wb36vAHHzg2ZDf32Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 3ahG4sSCEsTTlusQwo9o84V8sW-XRKM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5MSBTYWx0ZWRfX0pQStRp3hUiA
 v9OrC5oIPDqc358NiLtqqwzOEylrOPEY3EBcM1KStbX4ayfN1IkbicwwyUyQ8wBzdITeAPyJxiL
 9dO31fO8ycBpzhvTxC+x30zq8YcaCdcHXNsKtUXl8Wd/GIk7p554ZjOS9vzWELvG/nZmLMjE7Hp
 kYJXsC1dBp71tyncWZ4JEXDGU2Bb2KKO1+TAWtzGzbShj9eSTu3erAwUHlr7HgZkXkyJ41V89a1
 qCF2hzt0xHtLVl5P0hWyGZc+JXtaUHqaooMZ9dO7vPhbNeGVrtJKNcKwyOfVv+CBEEMQElFxQ/2
 8I+twQfXxGT28hixWE/+CoI0NcRw8wUaEkt8PhdJLnw/s2ZIPqcQqQQE/CkaS+bnTZeu9Jc7fP9
 HkrWb3TsXtzmZqrYX64NdNnxNmFMEVY6VSNrfpQ6+prXfv/vrc9pcmEBt/1uWi+leulngTwz0/n
 S8d5N8+THtf5KL9fEZg==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a626dfd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=7tSWEDlCfLhq9vGkEV8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5MSBTYWx0ZWRfX9GvNtdX1KcWj
 nxYFrReKE+CWxUc9WXNQPKEXVmYsr7drUbLkw/4p5L9LrRq9Vp0VcIi5Sip1t3SsbONMYPOpufE
 dJp0ht4XlCINZNg/O8VXsEKoIFDUBXw=
X-Proofpoint-GUID: 3ahG4sSCEsTTlusQwo9o84V8sW-XRKM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230191

On Thu, 23 Jul 2026 at 22:24, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 23, 2026 at 10:18:47PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 23, 2026 at 08:38:09PM +0200, Christian Marangi wrote:
>
> > > Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
> > > they also use the storm driver for the strange attached speaker.
>
> > Ack. Then pretty please, could the OpenWrt community please contribute
> > those to the mainline. It is a quest and a process, but it helps us to
> > understand actual hardware users.  Not to mention that getting platforms
> > support upstream would lower the burden of rebasing on the new upstream
> > kernels (assuming that you are using close-to-upstream kernel) and it
> > would also save from similar cleanup attempts.
>
> So should I drop this series for now then?

Yes, please. The driver is being used.

-- 
With best wishes
Dmitry
