Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CEE20F066
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070488; cv=none; b=ToYv61mHN1aqUcuF7Tafqx8kpWLmJ4LftsNQ4EhSosyOO62j59ToEoZVPIWUofw6uGYNTa6yIePpV/oYqccq0K0VQ00TENfjfufTwxAckSNe6J9KHTmvleMasiTqdvof/775PKLyQOPgNBU6WHIEapoiknDGaVUFnCn0SWYrx7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070488; c=relaxed/simple;
	bh=C6Yhmj5NSDmuki5prkNWWgqAqbPvRZU5lqPe4zAvakg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNcc47IYZh/Yf1hV6BcDPULx6WD1fxaxlBsl7TAFglLdXcMs40oetQrzy4kDYy268e+c6zCSvqT5bzex77AUPXZp5m7XzAxYRnZM4CMNRW5mFS0BtcJ1/uK1GxzWk5d2rnMTPgP4FRnnw0MjH2PPwPBM4ECOGcdia3TnvW6Jsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PH3/UzjT; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PH3/UzjT"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2955041a91.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743070486; x=1743675286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXU1FLrii1vst2IhDKt8s9STfEquca1Y5iYBAMgYvYg=;
        b=PH3/UzjTb/1krpG8Qhb+auQ/CnsfSOHHdB5Q+A0CQ6doDY651lqKw/HkA7VjN8r5tU
         CrY0UQtBs3JEewTrzqDftEEb9Zb4gVZoJ9ZT4oM5VT1B0UXMzRfMBeO9G8dNVh5Cyq+4
         VYZvKWVsJQ/OwT7buSyKLOanCGFys1x1pAC8KdMiTHANjyFOHsDfMLp0FsGZx/VsjlRV
         YI8zgtsxAa80/58k6PTyoEEbR4MsUUR+671M9ABK5abRbO8EZtGaoNT870aDpujfno5l
         jGR45gPctibq+09rgy/uirYVpVDif3QdRwQf0cuL8YJlBvdrPEmpVrPBKUkmP/gSMuyW
         svcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070486; x=1743675286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXU1FLrii1vst2IhDKt8s9STfEquca1Y5iYBAMgYvYg=;
        b=G3MViZ1Lssw1j6RFGojBPmPzR+Ztx2JpV52ibbjghmStFgAJ0l7nQMqD+8vM8S8YjC
         bW1lBAjMc61hoYYHI/TquA5MlGzVuAJLM1wuoRwSY0xat6GQrpwaiXLWlI9nx/gcSulR
         sh40n5S281TEjDG6WJZWi7kmXiA1QEjdl7GzvlRWiT2mFX50U6FguALbPMbNKtsHEjIx
         lH3tI6TtbdP2BvuTNQEAL2ilW/gJ1/is6ESD5FkX1xEBLQyXE8L93VSX87xpX6ZezUjH
         XG6QN9jdNKMdNBc942qfiOSH0ko3p07iMNfJvICho/c7F6N3CslIGgf0M3/QAteM/uJB
         03Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXcfAEMAMM78FFv0IUiPmpR4ZbHLb2H5MeUjeElSw7AmvJqsb2kGrytz/Ar3RSazJw5FfDgVmpnbEOJjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zgxFFly00KZ67R6faeogwcX05/KvbOluE+hrB2PRbtXDE/wP
	jvEupuPQf4p86BuGMOoVBrnVNMCKke90iFX0BOFM3AWYc2eFWP1ZD9f3RLLGfdhGX3uh7WG69y0
	hgcefiJhfFfBZtp84Izrmxk4JdgVLvY9j0lh6
X-Gm-Gg: ASbGncsP+vRCC8/6pN1N0S76kJEYUL4CVeLu5HQTeDWuEZRIYMQ1X9nvr22jTAgzv0G
	+LYqm0U5EaqCkRhP1yWMnU7YqsZFkRtH19td75bKk9EBmchZ+Ms5PfJzgD9SXpARCBQ9f+uvK5O
	Ozdm2snX9ykOJrNRLvlmOfUmiiQWXMiDxVvx8112Skp/vYadZ/7yXyT7Sp
X-Google-Smtp-Source: AGHT+IE1AefcJXIAWpDxPG3bUQ0bh6A+2grtsHhf+KAx7LnCFJqdzcBF4kLKgl+IZnDTHnXwKb1Ss9FhuZTqsrkbkRw=
X-Received: by 2002:a17:90b:2cc3:b0:2fa:4926:d18d with SMTP id
 98e67ed59e1d1-303789576damr11844174a91.13.1743070485612; Thu, 27 Mar 2025
 03:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com> <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh>
In-Reply-To: <2025032734-reward-fantasize-dc16@gregkh>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 18:14:00 +0800
X-Gm-Features: AQ5f1JpamchKB-mbo8HzMPc07dJP4L7AYc2gJudLypuurcRTBQseSpaQIpAXpM8
Message-ID: <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org, 
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org, 
	lgirdwood@gmail.com, krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com, 
	Thinh.Nguyen@synopsys.com, tiwai@suse.com, robh@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 3:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> > Hi,
> >
> > We have implemented and verified the USB audio offloading feature with
> > the xhci sideband driver on our Google Pixel products. We would
> > appreciate it if this solution can be accepted. Thank you all for the
> > work!
> >
>
> Great, can you properly send a "Tested-by:" line for this against the
> 00/XX email so that it will be properly saved?
>

We(Google Pixel) only use the xhci sideband related changes and two
changes in the sound card driver. For the details, what we actually
tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
Do I still send the "Tested-by:" line to 00/31 email? Or should I just
send the "Tested-by:" line to the 8 changes above? (I added
"Tested-by" line for this [01/31] first.)

> Also, I think a new version of the series is coming, can you test that
> to verify it works properly?  We have to wait until after -rc1 is out
> anyway.
>

I think this v36 is the last version of the series as I discussed with
QCOM Wesley. And for sure I will test it if they do have a new
version.

Thanks
Puma
