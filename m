Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921833D5642
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882678; cv=none; b=W7u9My4ufykktydyYY0B3yRGTshT4VBVhnnFnJqj3v36FwtZpJ0VZUPtAsQmIECWgfDeE7/41h3gaoZ2V1q/bNZTj9EKh3leGCb2xuj5YNKQ0Akze7k1fpz5Q//sPr/n4XKhJwNClC4hpaBn3BjTlBt9aWvgJY3AWRPRHrF745o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882678; c=relaxed/simple;
	bh=bA0ojffaBxKxeWvxGumymJvixc9RGgZCEr8WR+dCnTs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KegMVkRd2frycEIhQCXUzSGFKDE8DqLn1QRtwNS09FYguG2b4iOm+LwGxmFLNQR/cLZFees8eU3e7rU+T6gAsjojaTMOvgs3NveyuRvATibKiPcxEiYyn8S7pteu+eaQE0v3MFQHIDvjgWLcwvNyfdS540cvUR1Ttf/6p2tM9g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvngO2D6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvngO2D6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so22713845e9.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882675; x=1792487475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HorRZsv0ApFSmwyBfGvfcGzqRjtFYOH4ZKXfvPQUyFI=;
        b=TvngO2D6HRuMy/2pf9pLZgq64Cy+ZYJAqtQ5IA6VKitTuNdzAQR6v0DrzyOr4Ge2Kv
         4dbsOUhIF3Yn+6b+F01wl6W7oP6MQk6aormWcpr6GEO1J9JxbRBrqY5AvRhO94KacYnd
         9Wf1dVca7Eru8A8MXEgSoRc5WE5JJ3hS2lKJEFG39UrtH9mKHZKMJAV7yDYdW/8UVL4+
         0p6zmYnOPoqNMZEQ/gtWRG89SLQgcMBXfV0lUg7STElLbnzjYPluZP80k83vMPyYVpKi
         kfHdDdr2zaZrw8u6AYhQ+UAstC6lpp9DC9ql77NTEacMmF1IBpLUmA1fnDs6DV0XLJ12
         GooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882675; x=1792487475;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HorRZsv0ApFSmwyBfGvfcGzqRjtFYOH4ZKXfvPQUyFI=;
        b=qt+nLVYMwUN2BxL7niNi4rgcvIIYdWeDmm+FjqdU8dWZ5ufVl6Ik9ohPyGJn78mPLV
         ZXaBQyYp3WVXfk6ZmEJIMM0fNSvpyANS9fOfZ4oiOnCiUUSkbTG+18Ie6lIb7AAmbMz4
         Qrs8BKJcGxzeT4l+6i7Qq4DQ4HLfEf9Fxaq2477XVp6qrdlzUkg3mZduR1aJdDEuX/gD
         +a1hHBbkdYlyKIfr6TdgC/17KDALGnmls79N5RVn4mWzuinBWPuq22vj3Ote/SqzqcPS
         hYLZxkSP0txQpSJvH1Dbe0qrIHmrCyIDovOL29TQFqi22vGIe+94jjCMjSX6t7TeED/9
         4qMw==
X-Forwarded-Encrypted: i=1; AKwUvBznSLIJn/CRBcOL1XN94TrA4q+hLquAV4hsxWK6CgohwCS70dSP2nccK6wjc53ENP+RdYyWtpxFSKp0xQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2yXmjnc2kcH7rgQbKQX7qAojVQY9ESVw+zbRYtDeHC9JAmw6x
	gbcsVdks4iv697tOANAGJiiD8T23mKDHenUWZ1WxxuYSylQqAnn37wI/
X-Gm-Gg: AYBFou0wU556WAdFmXKg5bk3lJt/JRQWobB3sB4ArwD5VDRo1Vg0s0D9IKxzpQLi2Q/
	l/D9xYBW2D3XHpguhigwMMpI0ZdqDXkigxzzYbb518hl394zReXDfA35HJAtRCMcqL4W6CXUPQA
	Sz6u0uFESlKwBBFzgGikWGgzJWWxDsAhvBrbZpMTFFefEwpJXmxeyLm8wmWZIZgHjAvyZ3reaDG
	VMFMBh4LYgt7KOop/fJ4PW7BiU7Zhh9v8STzYFm3MTdvRASQC0aYHCiBp+XrT1XV2XEy7PzY8mv
	i6Ou4KwhU73YI1VDR1cS4/OljoJrHzWcr69qppH5bXHSQzIyGaoCSoos8NRLb9zMGHlYjI2o9by
	YXiVyyB7RryBYtjrW7RDQqWQVww5SJnNfjLvaZme8aQ5NZZOl3zxZSDnjJoKO7vjM6fVgjDYMe+
	JpHc/Ss0R1CVcDfTcVeEuhpLvPo4RhWUuUKCXNfJMLoufwd/XIYqKGjkSCVSQoF7oOUXXl0x0Wt
	Oqk3LFdGg==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr240551845e9.20.1791882674629;
        Tue, 13 Oct 2026 02:11:14 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm399607545e9.7.2026.10.13.02.11.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 13 Oct 2026 02:11:14 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:11:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
Message-ID: <20261013111110.423dd0ff.michal.pecio@gmail.com>
In-Reply-To: <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
	<20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
	<68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
	<82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
> > xhci is the one allocating the ring when adding an endpoint, and
> > telling xHC hardware to write to that ring. It seems more
> > approriate that xhci should be the one freeing the ring after it
> > told xHC hardware to drop the endpoint, and there no longer is a
> > risk on hardware accessing it. 
> 
> Hi Mathias,
> 
> Sorry for the late response.  Was out last week.
> 
> Specifically in the disconnect path (while audio offload is active),
> when we utilize the usb_set_interface() path, it'll return early due
> to the iface->unregistering check.  This would lead to the
> drop_endpoint not to be called, and rely on the xhci_free_dev() to
> handle the transfer ring cleanup.  This wouldn't work in the offload
> situation, because qc_audio_offload is the only entity managing the
> DMA pool, and that would be freed during the .disconnect callback,
> which happens BEFORE xhci_free_dev().
> 
> Would you be more inclined to prefer a solution where we can defer
> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
> adding another sideband notifier (sb->notify_client) enum to tell the
> client driver that it can release the pool?

I'm not Mathias but my opinion is the same as always: none of these
problems would exist if the sideband client allocated and freed all
transfer/event ring memory, and xhci-sideband only owned a mapping.

The mapping would be freed by xhci_sideband_unregister() or similar
calls, which should ensure that the xHC stops using the rings, and
memory would only be freed by the client driver after unregistering
the sideband and stopping the coprocessor. Nothing is ever UAF or
leaked, and ensuring this is *easy*. And if xhci-hcd randomly wants
to get rid of some endpoint, it simply stops using the mapping and
lets the sideband client clean it up two milliseconds later.

One thing I'm not entirely sure about is how we could create this
mapping. Using bare iommu_map() creates a hard dependency on IOMMU.
Documentation/core-api/dma-attributes.rst mentions possibility of
using generic dma_map_() helpers on multiple devices, so maybe this
can work, but I haven't seen existing examples of such use.

And there seems to be one more potential problem case, which hasn't
been mentioned in this thread AFAIK: if xHC resume failes, xhci-hcd
frees its private data and tell USB core to reset-resume devices.
Looks like another opportunity for UAF.

Regards,
Michal
