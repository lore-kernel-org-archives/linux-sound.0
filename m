From: Magic Phibo <phibo@gmx.li>
Date: Fri, 05 Oct 2001 00:05:40 +0000
Subject: Re: Problems recording sound with ISAPnp Soundcard since Kernel-2.4.x
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD"
Message-Id: <marc-linux-sound-100224071530935@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-100220329623616@msgid-missing>
In-Reply-To: <marc-linux-sound-100220329623616@msgid-missing>
To: linux-sound@vger.kernel.org


--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

>> Since upgrade to Kernel-2.4.x (currently 2.4.10) I got problems recording sound
>> causing following error message in /var/log/messages:
>> 
>> Sep 30 15:53:16 osiris kernel: Sound: DMA (input) timed out - IRQ/DRQ configerror?
>> 
>> It's a redhat dist. (7.0) with a Yamaha ISAPnp Soundcard (OPL3 YMF719) and a
>> self configured Kernel-2.4.10.
>> 
>> [...]
>> 
>
>I also noticed this problem ...
>There is a problem with the initialization of the DMA channels (dma and
>dma2 are never set to the real dma channels, and they remain at -1).
>Applying this patch fix this error.
>
> [...]

I applied this patch and now recording works fine. So, the problem is fixed !

Thanks a lot !


Cheers,
Phibo
--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD
Content-Type: text/x-c;
  name="patch-kernel2.4.x-opl3sa2-dma-init"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch-kernel2.4.x-opl3sa2-dma-init"

ZGlmZiAtdXIgbGludXgub3JpZy9kcml2ZXJzL3NvdW5kL29wbDNzYTIuYyBsaW51eC9kcml2ZXJz
L3NvdW5kL29wbDNzYTIuYwotLS0gbGludXgub3JpZy9kcml2ZXJzL3NvdW5kL29wbDNzYTIuYwlX
ZWQgT2N0ICAzIDA5OjM2OjE2IDIwMDEKKysrIGxpbnV4L2RyaXZlcnMvc291bmQvb3BsM3NhMi5j
CVdlZCBPY3QgIDMgMDk6NDE6MjggMjAwMQpAQCAtODYyLDkgKzg2Miw5IEBACiAKIAkvKiBPdXIg
b3duIGNvbmZpZzogKi8KIAlod19jZmctPmlvX2Jhc2UgPSBkZXYtPnJlc291cmNlWzRdLnN0YXJ0
OwotCWh3X2NmZy0+aXJxICAgICA9IDA7Ci0JaHdfY2ZnLT5kbWEgICAgID0gLTE7Ci0JaHdfY2Zn
LT5kbWEyICAgID0gLTE7CisJaHdfY2ZnLT5pcnEgICAgID0gZGV2LT5pcnFfcmVzb3VyY2VbMF0u
c3RhcnQ7CisJaHdfY2ZnLT5kbWEgICAgID0gZGV2LT5kbWFfcmVzb3VyY2VbMF0uc3RhcnQ7CisJ
aHdfY2ZnLT5kbWEyICAgID0gZGV2LT5kbWFfcmVzb3VyY2VbMV0uc3RhcnQ7CiAJCiAJLyogVGhl
IE1TUyBjb25maWc6ICovCiAJbXNzX2NmZy0+aW9fYmFzZSAgICAgID0gZGV2LT5yZXNvdXJjZVsx
XS5zdGFydDsKQEAgLTk0NCw5ICs5NDQsOSBAQAogCQkJICogIGdpdmUgcHJldHR5IG91dHB1dCBm
cm9tIGNvbmZfcHJpbnRmLiA6KQogCQkJICovCiAJCQljZmdbY2FyZF0uaW9fYmFzZSA9IGlvOwot
CQkJY2ZnW2NhcmRdLmlycSAgICAgPSAwOwotCQkJY2ZnW2NhcmRdLmRtYSAgICAgPSAtMTsKLQkJ
CWNmZ1tjYXJkXS5kbWEyICAgID0gLTE7CisJCQljZmdbY2FyZF0uaXJxICAgICA9IGlycTsKKwkJ
CWNmZ1tjYXJkXS5kbWEgICAgID0gZG1hOworCQkJY2ZnW2NhcmRdLmRtYTIgICAgPSBkbWEyOwog
CQogCQkJLyogVGhlIE1TUyBjb25maWc6ICovCiAJCQljZmdfbXNzW2NhcmRdLmlvX2Jhc2UgICAg
ICA9IG1zc19pbzsK

--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD--
