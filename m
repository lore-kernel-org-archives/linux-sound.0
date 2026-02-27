Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794732F0C48
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195521; cv=none; b=UD2j5Mb1FQwwZPNK3jlCffv3Zm/brX60ObZU42J31g1OJ1IWdn7oUx4JeHJsB9CivEn8dbGrMARPvBvhoPcLDEboB3hcV8HLKeFyUrINaGH1O9+B9TkeikpG4w8lBZVgq51y5+y3hPopd/zSHmDd9a3d36dietDC1rQa3bo055s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195521; c=relaxed/simple;
	bh=AQoCa8HSU57FVEnyfNGlpLBzlqZ7NfoICy006X5CqEk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ap7DPWb2rwGQS5DIW2vyIoFQ4B98RTB2POXmc4NJzIdyfEDfDq+lvfFEML9BqNebm/v9TTJftZVP7YnVxh6fY3ebsVdO9WMf/PDxhAEgpQ5fA0n5r+OPO6S8ymtS/lnQVm3xm77OVsflFLV42TO+tkBkDMfLu1Ywm5sD1WJj5v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wjCa6sEV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wjCa6sEV"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65faaa8b807so3746110a12.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772195518; x=1772800318; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLaJkgzjmvXyubyZDm6S8qBRFRZ4imol4EtJej/eQAw=;
        b=wjCa6sEVA0DzJYkZKpYj5zilHglm+TFvsU+UVdt/dRdH4zW2fdjOpI2EojKvxcjyAJ
         GE2wRGtrzVre42HV6UtoibTS6U1pWOjfpKz5jbFO+hdTJsprMFUxzq5CYGpJqhwytoSu
         Y/AzI5P+nY/nd4cB0dlHnlIXcVKwvUybVVwjddRthstmjUHatx1UQPhzZgKSzcD/ZVHM
         S+3TA2y423mtTY87kcU2N+5oXILrmko0eeRjrLUPq9SYkq7ZjfJMo935CEsefjTxK1Ca
         8rZvHFRym1D8i1YUFlhYRItEP9brG+Jn8mpXGJE7nH95jFDFlDSnOxxG8WoWCEw284vc
         P7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772195518; x=1772800318;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLaJkgzjmvXyubyZDm6S8qBRFRZ4imol4EtJej/eQAw=;
        b=lDu5r1EtDjkaz1gdnt/09PK2OjjH7745Sl7RaYMecJjemiuAioRY5UZIWtqpmUPqk0
         viuh2iOEyOZL3NltD9fZiOWjqZeyiItxAXon+M1nK1TSygVeZAPMpc/eQzadJBIPLLVA
         WQuvtG6NWnGKC43zDK0PIL4sLYyyYfRzWIKm1XaxTE6p2SWEfd/sAZbPo1FZMaquQAWJ
         858x/ClPS7YPQHJ9tG32N6JbrQ9270toKq/QgKotNRAnLqjVAihfBU2B6Wl7QbXszuBa
         jYdhgWlD4T8ynHIWj0FFiCfpUe2mNaomBcAVAlNHC2GFsWx3ORuXNOzGN9yFYF1eGbc3
         SnpA==
X-Forwarded-Encrypted: i=1; AJvYcCUwdm+xRd/EGybprA4ZgprToOFxL14CxTwf1EBYZr1QXqmpent3zHFWj0cecpDC/8bs3Q8eR8CkoEZ7TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQjQ12i5IrS2KjADjaDqtLWEmJYvbO6cZVPWtE1MvJkgjlupW
	28PRwvBcxeLmmUKLYwg078JguDfHf0vpkasmllCL0JMcd93j8pnOQ4qzGF7cD64KfAc=
X-Gm-Gg: ATEYQzy+ALuDMUF+dwWKew1CtQH/hlSh1zK7HocZQzSzrflmp6awPi1LgKaPRmnALrM
	Ajs5lu5ukMDfOUFeTOyJaZKDudG31gzzc9D1rp/0ZVzK5lDPB4SdNmZOd3NP3sHsyO+0U1UiXDw
	MFBS+m30MduP9uJChNqMDvAlaTb4r2hJ+JHJNtNyd0IIPCCi9LApcHEewBYQnP7nn29+2N7FCSJ
	OYKaxRuQ8Ii46GeIhfSdvE+FnQcy7MPvhoY1Z+SyNS3ie8zobNTe+BPEWksY4JxqEHRJVQH0K5r
	zH9TNb2ZmNZ+n6Krxq2Nk0bRSJLPb+BUafvZLqD5591wqlF9sWv4O45fwblLSYisUwzFNqrHkRw
	DRzOnrF9Ksk+fsfy9pvKi4xRSjqE0a47lsttXqmhZl/znkz+O8pNGw9KKF8ynOnG5QK1VpQ7l1S
	g5rd0Nd8Vu0rYGUEnZS0xuGd6zEohzx2uWlB9cVot1QJfseUTIbN5ZwwUAEOAnM11mLSVz
X-Received: by 2002:a17:907:7247:b0:b8e:3d49:25db with SMTP id a640c23a62f3a-b937659a34fmr174365466b.54.1772195517688;
        Fri, 27 Feb 2026 04:31:57 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac74adasm142629666b.27.2026.02.27.04.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 04:31:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 13:31:56 +0100
Message-Id: <DGPQVOVH3N31.2XHZP30TUC18Q@fairphone.com>
Cc: <conor+dt@kernel.org>, <srini@kernel.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <alexey.klimov@linaro.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Luca
 Weiss" <luca.weiss@fairphone.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <vkoul@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
 <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
 <a814c0bf-e421-4cf2-8b9b-e5dac9b80dff@oss.qualcomm.com>
In-Reply-To: <a814c0bf-e421-4cf2-8b9b-e5dac9b80dff@oss.qualcomm.com>

On Sun Feb 22, 2026 at 10:09 AM CET, Srinivas Kandagatla wrote:
> On 2/20/26 1:34 PM, Luca Weiss wrote:
>> Hi Srinivas,
>>=20
>> On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
>>> Number of input and output ports can be dynamically read from the
>>> controller registers, getting this value from Device Tree is redundant
>>> and potentially lead to bugs.
>>>
>>> Remove the code parsing this property along with marking this as
>>> deprecated in device tree bindings.
>>=20
>> Could you help suggest how to correct kodiak.dtsi?
>>=20
>
> This needs fixing in kodiak.dtsi, for somereason the dtsi is trying to
> add ports that does not clearly reflect the actual hardware.

How should the qcom,ports-* properties be updated to be correct?

I'm seeing the same on Milos, where the hardware registers are +1 from
what downstream describes, in all 4 soundwire controllers there.

swr_rx (reg=3D0x03210000):
    SWRM_COMP_PARAMS din: 1, dout: 6 (=3D7)
    (downstream: rx_swr_master - qcom,swr-num-ports =3D <6>)

swr_tx (reg=3D0x033b0000):
    SWRM_COMP_PARAMS din: 4, dout: 0 (=3D4)
    (downstream va_swr_master - qcom,swr-num-ports =3D <3>)

swr_wsa (reg=3D0x03250000):
    SWRM_COMP_PARAMS din: 3, dout: 6 (=3D9)
    downstream: wsa_swr_master - qcom,swr-num-ports =3D <8>

bt_swr (reg=3D0x031e0000):
    SWRM_COMP_PARAMS din: 5, dout: 4 (=3D9)
    downstream: bt_swr_mstr - qcom,swr-num-ports =3D <8>

Regards
Luca

>
> --srini
>
>> I'm seeing these warnings on QCM6490:
>>=20
>> [   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch =
with controller (1)
>> [   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch=
 with controller (6)
>> [   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch =
with controller (4)

