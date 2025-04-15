Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B62951AA
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 10:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713958; cv=none; b=qbHmnmoTQoCGTpn2vSk73IcqH1dUGGy07/lbdSalfxVZ5Qhi4giMChwlAs/n/M4sgY/v/Ub7KJ7zm8nnDRPE2hy425o0UYN1bzUfbDBNBUHGTAPucYQ01AmIbxZes7MBuRF7/deiS3bLoQvKJ5nC8L7ZzCTYRMC8U8SzBkSRsEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713958; c=relaxed/simple;
	bh=0Bua0b6ltajIk/IV7dsktL0yBFny0utxCY0myvascDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdpquGCEXmWGOrgfDUaNShJIqEsGckbpetT+h4CzRbCJxMlCQjTNVftaCRhMZbHa3MEdrnVgXlCgKuC7Fe+65rjUCDSJ4gChBhjMZM+o00V4XbxFDCleeMkE1H2+IcW9wBVZN8SMtGC8zccG5fKiCTIyBFkIIYr0X645NDpEO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDMnUS6V; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDMnUS6V"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso38338115e9.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 03:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713955; x=1745318755; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9b85hp9a7l5N4Thq+QH9dyzdGxINhT/insv65u07NIw=;
        b=pDMnUS6VhPL/v1IIyBz60Rt+iCL6l2oZ+RHOGvEAuXDU1L144jNIHbLCVladzF0tOx
         DM1gEqCJw1eQ0dwUk2DXbptm3OF2NFaFy7b9DnaAd8QxJS9zA7w6I3Sf9lp3CQ1M2lPe
         HCaWJbeOK7kjzXMad96LBaJOQ7W+XVzcGllM/olVskp7UV+yBzX4x+5Tjxi4MRnBC6t3
         aQXZ5Mq4TfJpwiZB4+nEqVHdB96i6gr8T5gqdAZ5L0ZDBj+Y0vYd8P9H6UsGUMyyp0dc
         mEJoT/XnnagaJPjuyaFDi8RazysivG+V/sAUVnDJ3Gjy1C+zrOoVYO8k3a5SmDpXJuF+
         gGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713955; x=1745318755;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9b85hp9a7l5N4Thq+QH9dyzdGxINhT/insv65u07NIw=;
        b=qQwkjEMb8BTPEPOFRvD5rGQpTwfZm19ZF9yHqms7GHqO5+782u0rz6zO0zUODcNLlP
         +UWrA1aFtG1KB/xHJRdyL+ehEH5vst+SFFOiZUTGWXsbh4Zgd7Nhf3ryJAfWI+t9EaZf
         uYOB8hQeMRJuS0HoFLxS1h8Bmrk+C4oo1zOh8gR8o/fNqC3FuM6pA6vt6QfWF0kCTsh4
         tkZpDezHPjEUrK8IHd4gr/MvdyqmaTin7aoIjLe3QpdFTYdB121hmTiM4U9DMFU/vZgb
         n8IF+dypITV3+I/aIqQ0KZrDrc5UI7FFwoejnEWzKwPyq19lfmDu6U5v1avYROAV8EoV
         3cow==
X-Gm-Message-State: AOJu0YzAWOjHeRc5hEyuSEkYX8IUsDGJxRJRNnLlA1y70/radVp2xREc
	hN9MriUSz99LVOUexuPXWOAFuoE+eVWB6lPBRfdv7U5b0rGol1ZnNs6xhgUclyiiKtrIwwaWDKm
	O
X-Gm-Gg: ASbGnctcyetxdGv70dzQyptnrZRNLPqMfQGjWbwjczIjgYQm7/AZsB9XPI3z6/m6MNZ
	kNSlJsAJIGq8u8vtw9WWaqxl2VP8e00JoDuRQHRWnxkwqaSOpwzbGKRhVXHqig9flpxP32qvfNX
	aNFkT9cOeKikXhOcfc3qlgxtUPfgsWapMYhbAkjIFOiEFt+8KbH0xLtj8T/Ho3YM1QAVfePHGnL
	5UZcGfWGLy5drKv4DkvEZnbNf+dimO5oA98UMQqdXYG+fFar67h8XLa0pgOxeBLHLkfkxW13/XJ
	03tCd5dRCFn0WRE8/OS6XLWj6jM4e1AuJi58P6C7fdqtvA==
X-Google-Smtp-Source: AGHT+IHvpZrr2NcmY1IfiS0xuukYrILY3e/zArz8LH9DXkkSQeEJrbtT4h7jsJGnurrbIP/SvoXcYA==
X-Received: by 2002:a05:600c:3b19:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-43f3a9b02f9mr154465235e9.27.1744713954677;
        Tue, 15 Apr 2025 03:45:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f233a2f71sm203778595e9.15.2025.04.15.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:54 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: qcom: Introduce QC USB SND offloading
 support
Message-ID: <Z_443_0ySk7a19w8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Wesley Cheng,

This is a semi-automatic email about new static checker warnings.

Commit 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND
offloading support") from Apr 9, 2025, leads to the following Smatch
complaint:

    sound/usb/qcom/qc_audio_offload.c:1454 prepare_qmi_response()
    warn: variable dereferenced before check 'subs->data_endpoint' (see line 1369)

sound/usb/qcom/qc_audio_offload.c
  1368		resp->std_as_opr_intf_desc_valid = 1;
  1369		ret = uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
                                                  ^^^^^^^^^^^^^^^^^^^
this dereferences subs->data_endpoint without checking for NULL

  1370					    &resp->xhci_mem_info.tr_data,
  1371					    &resp->std_as_data_ep_desc);
  1372		if (ret < 0)
  1373			goto err;
  1374	
  1375		resp->std_as_data_ep_desc_valid = 1;
  1376	
  1377		if (subs->sync_endpoint) {
  1378			ret = uaudio_endpoint_setup(subs, subs->sync_endpoint, card_num,
  1379						    &resp->xhci_mem_info.tr_sync,
  1380						    &resp->std_as_sync_ep_desc);
  1381			if (ret < 0)
  1382				goto drop_data_ep;
  1383	
  1384			resp->std_as_sync_ep_desc_valid = 1;
  1385		}
  1386	
  1387		resp->interrupter_num_valid = 1;
  1388		resp->controller_num_valid = 0;
  1389		ret = usb_get_controller_id(subs->dev);
  1390		if (ret >= 0) {
  1391			resp->controller_num = ret;
  1392			resp->controller_num_valid = 1;
  1393		}
  1394	
  1395		/* event ring */
  1396		ret = uaudio_event_ring_setup(subs, card_num,
  1397					      &resp->xhci_mem_info.evt_ring);
  1398		if (ret < 0)
  1399			goto drop_sync_ep;
  1400	
  1401		uaudio_qdev->er_mapped = true;
  1402		resp->interrupter_num = xhci_sideband_interrupter_id(uadev[card_num].sb);
  1403	
  1404		resp->speed_info = get_speed_info(subs->dev->speed);
  1405		if (resp->speed_info == USB_QMI_DEVICE_SPEED_INVALID_V01) {
  1406			ret = -ENODEV;
  1407			goto free_sec_ring;
  1408		}
  1409	
  1410		resp->speed_info_valid = 1;
  1411	
  1412		ret = uaudio_transfer_buffer_setup(subs, xfer_buf, req_msg->xfer_buff_size,
  1413						   &resp->xhci_mem_info.xfer_buff);
  1414		if (ret < 0) {
  1415			ret = -ENOMEM;
  1416			goto free_sec_ring;
  1417		}
  1418	
  1419		resp->xhci_mem_info_valid = 1;
  1420	
  1421		if (!atomic_read(&uadev[card_num].in_use)) {
  1422			kref_init(&uadev[card_num].kref);
  1423			init_waitqueue_head(&uadev[card_num].disconnect_wq);
  1424			uadev[card_num].num_intf =
  1425				subs->dev->config->desc.bNumInterfaces;
  1426			uadev[card_num].info = kcalloc(uadev[card_num].num_intf,
  1427						       sizeof(struct intf_info),
  1428						       GFP_KERNEL);
  1429			if (!uadev[card_num].info) {
  1430				ret = -ENOMEM;
  1431				goto unmap_er;
  1432			}
  1433			uadev[card_num].udev = subs->dev;
  1434			atomic_set(&uadev[card_num].in_use, 1);
  1435		} else {
  1436			kref_get(&uadev[card_num].kref);
  1437		}
  1438	
  1439		uadev[card_num].usb_core_id = resp->controller_num;
  1440	
  1441		/* cache intf specific info to use it for unmap and free xfer buf */
  1442		uadev[card_num].info[info_idx].data_xfer_ring_va =
  1443						IOVA_MASK(resp->xhci_mem_info.tr_data.va);
  1444		uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
  1445		uadev[card_num].info[info_idx].sync_xfer_ring_va =
  1446						IOVA_MASK(resp->xhci_mem_info.tr_sync.va);
  1447		uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
  1448		uadev[card_num].info[info_idx].xfer_buf_va =
  1449						IOVA_MASK(resp->xhci_mem_info.xfer_buff.va);
  1450		uadev[card_num].info[info_idx].xfer_buf_pa =
  1451						resp->xhci_mem_info.xfer_buff.pa;
  1452		uadev[card_num].info[info_idx].xfer_buf_size =
  1453						resp->xhci_mem_info.xfer_buff.size;
  1454		uadev[card_num].info[info_idx].data_ep_pipe = subs->data_endpoint ?
                                                              ^^^^^^^^^^^^^^^^^^^
So this check is too late

  1455							subs->data_endpoint->pipe : 0;
  1456		uadev[card_num].info[info_idx].sync_ep_pipe = subs->sync_endpoint ?

regards,
dan carpenter
