Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924223A257E
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155260; cv=none; b=XPWdX7Kk9bUTpDOefxExgLSg4jUmvpVEKOoh02n421zdjGiEdztkGw9nlG1nDZIMaEw7b96P3KETfublyKmJDgV3fF/4YnU4Zo5/TYyMVG+YC0ynPHxDd5KfF2ROCUjXZR7/lPd9O7eGJl3Bt1pQCVJ+tg9oniqS3jSidgN4C2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155260; c=relaxed/simple;
	bh=ylqS5yKsa7ZTa3DL/DveejMpe/gJETrylgALZdd9zw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+Wejq7+REMIKZt4rN8b+DHe8yPCUZG6DcZYhviUhBRnj5kRxj96wQfsSe1XlaRM2DkT32ta7iP7pvbQeI2XgIk6zXRRq7foziMBZwOU2NisNSCL5BVeYYmmdzDszvSqgZStFIrAHthkndQ5nNS4L0mxe44Ov5QJ9hVJKl1Uytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj+82NtS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj+82NtS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-482f454be5bso55567665e9.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 01:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776155258; x=1776760058; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FSwSz69E4aI82KZSUjzQfuyPV8aEzQQEwDxHErZLN88=;
        b=Uj+82NtSIJRnjOSEMuIQp02KnhYuN56JIMmuOZ5kKQyY9kNrBXmH7PCAvA86Wzwajx
         QItdFYagpsH6hU932z1gP1Jsge+dreV5umMZq+GPFLyJXLNRm94I+ofcxdy7ARGt30Zj
         dwn5xHMr10L+R9tQp24eXbhtUlAzj1sHAk8UDxSwEswVPxTjg3AQ1Dq5ujCwx1NpaE3w
         8G1X6zt8XWNJXPMuQoAWTIO2h6JxOIiLoLrb/eU7WIHN7XZfz5iaz0UktUMBW4T+LyaO
         13WjIj3568yLwb15zxxFu+mTqyDEWNtZYFY/YP7zKpaEX7JfjhRzdix0S/KZCPsTDBQW
         1aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155258; x=1776760058;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSwSz69E4aI82KZSUjzQfuyPV8aEzQQEwDxHErZLN88=;
        b=Vg6oO458HXvXa4VcPjj+Rp/5yfFuJdjVenXuGLUunLhMZASygKIN1ToDOL0e7rkM87
         4CWpoy0/6ZC5ECUFku93uROFJtplLtp1u7X93jelqc1gbm1o4GHsVNT9WaclhQFwzoxe
         Iu0WnHTgzoXbpqFdV+/ZukvCwAyxpWF0Piy6dlof5ZzpOrl/fWOji9IXjYBMLYOqrLsr
         z7cEsyNVsAkoE5mq0vnx4LLsp1Xht2ZLS2wyd6BnWaeatPTCvjMGjya2eCizdDyPSpJs
         Ybp6iDZhEAVD6ohiGFO3SYyUnwc98LBOF9P5PZ2uy+5YpCVqbAff1vNDhRoS9aBSdyYJ
         Lseg==
X-Gm-Message-State: AOJu0YzLm2dj41+5nYAhsHpnu/FbfE/khKUw1rnioiEuRmyDOttHnOd5
	b1nCZTf4F/suSU97gv5K+x9P0+e/tnIXNZP82k3NazpOeZgxZdHnqa5Q
X-Gm-Gg: AeBDieul/aJeWtdCC5P//Ng9gpYUA+C2oy0BuG24vzvrF+1AZtzlVCJ49gRsRjge/Mh
	be9H2ySPaQerUZm0n9FB3J0aHEvBwXjXlgmrqq550Su5V/V2SUMCI4vspZRolRV4bsAJYSZRbg1
	F02AQMCDe24rHtBJpqKha5lsbs6kOLjbYqqKPsOefNeQql2SWyJM9WruNSCU3D3D38TYNs4oxzK
	5y7CEWNU7Ruc/95vDV5Kudrw2ZzUcOfTjpLNNu5oY4KEczNoBj7grObcBSYdfcpx97bQMrLoPbJ
	KZTJjXs17f1So1N0DB05lm/eEBWhxRVZnqTiQLskvSxqGLrTg/gcbkwWclaITFAr1oiLEG/KarV
	oGaKuuN1Y5OyidkFgPcLMMx0/fi0xq9++Jg9raxDrRe66m9u3gpTYhSIMB4hnMElKllojJSeeMt
	KbjBr41GoOyc8SRczXm73yD5/19cRc5GF5O55lTFC2da+BSM0=
X-Received: by 2002:a05:600c:444b:b0:488:9c3b:ff40 with SMTP id 5b1f17b1804b1-488d6acd9fbmr183542875e9.15.1776155257887;
        Tue, 14 Apr 2026 01:27:37 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede15694sm50432765e9.3.2026.04.14.01.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:27:37 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:27:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: Add error checks against get_min_max*()
Message-ID: <ad36dGpCBTGsyFr_@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Rong Zhang,

Commit 4f55a85cd4fc ("ALSA: usb-audio: Add error checks against
get_min_max*()") from Apr 11, 2026 (linux-next), leads to the
following Smatch static checker warning:

	sound/usb/mixer.c:2711 build_audio_procunit()
	error: uninitialized symbol 'err'.

sound/usb/mixer.c
    2660                 if (state->mixer->protocol > UAC_VERSION_1 &&
    2661                     !uac_v2v3_control_is_writeable(controls[valinfo->control / 8],
    2662                                                    valinfo->control))
    2663                         cval->master_readonly = 1;
    2664 
    2665                 /* get min/max values */
    2666                 switch (type) {
    2667                 case UAC_PROCESS_UP_DOWNMIX: {
    2668                         bool mode_sel = false;
    2669 
    2670                         switch (state->mixer->protocol) {
    2671                         case UAC_VERSION_1:
    2672                         case UAC_VERSION_2:
    2673                         default:
    2674                                 if (cval->control == UAC_UD_MODE_SELECT)
    2675                                         mode_sel = true;
    2676                                 break;
    2677                         case UAC_VERSION_3:
    2678                                 if (cval->control == UAC3_UD_MODE_SELECT)
    2679                                         mode_sel = true;
    2680                                 break;
    2681                         }
    2682 
    2683                         if (mode_sel) {
    2684                                 __u8 *control_spec = uac_processing_unit_specific(desc,
    2685                                                                 state->mixer->protocol);
    2686                                 cval->min = 1;
    2687                                 cval->max = control_spec[0];
    2688                                 cval->res = 1;
    2689                                 cval->initialized = 1;
    2690                                 break;

err not initialized at this break.

    2691                         }
    2692 
    2693                         err = get_min_max(cval, valinfo->min_value);
    2694                         break;
    2695                 }
    2696                 case USB_XU_CLOCK_RATE:
    2697                         /*
    2698                          * E-Mu USB 0404/0202/TrackerPre/0204
    2699                          * samplerate control quirk
    2700                          */
    2701                         cval->min = 0;
    2702                         cval->max = 5;
    2703                         cval->res = 1;
    2704                         cval->initialized = 1;
    2705                         err = 0;
    2706                         break;
    2707                 default:
    2708                         err = get_min_max(cval, valinfo->min_value);
    2709                         break;
    2710                 }
--> 2711                 if (err < 0 && err != -EAGAIN) {
    2712                         usb_mixer_elem_info_free(cval);
    2713                         return err;
    2714                 }
    2715 
    2716                 err = get_cur_ctl_value(cval, cval->control << 8, &val);
    2717                 if (err < 0) {
    2718                         usb_mixer_elem_info_free(cval);
    2719                         return -EINVAL;
    2720                 }
    2721 
    
This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
